# frozen_string_literal: true

require 'rails_helper'

RSpec.describe NoteTaskPopulator do
  describe '#run' do
    it 'initializes the tasks from the content' do
      allow(SecureRandom).to receive(:uuid).and_return(
        '4809eabb-a536-4f88-a752-734b82a16e96', # for note uid
        '76de3a32',                             # for task b
        '4aaf4bdb',                             # for task d
        'de509b8c',                             # for task a
        '44d95f97'                              # for task c
      )

      note = build_note(
        content: <<~CONTENT
          <ul class="task-list">
            <li class="checked">task a</li>
            <li>task b</li>
          </ul>
          <ul>
            <li>not a task</li>
          </ul>
          <ul class="task-list">
            <li class="checked">task c</li>
            <li>task d</li>
          </ul>
        CONTENT
      )

      described_class.new(note).run

      expect(note.tasks).to eq(
        {
          'todo' => [
            { '76de3a32' => 'task b' },
            { '4aaf4bdb' => 'task d' }
          ],
          'done' => [
            { 'de509b8c' => 'task a' },
            { '44d95f97' => 'task c' }
          ]
        }
      )
      expect(note.content).to eq(
        <<~CONTENT
          <ul class="task-list">
            <li class="checked" data-task-id="de509b8c">task a</li>
            <li data-task-id="76de3a32">task b</li>
          </ul>
          <ul>
            <li>not a task</li>
          </ul>
          <ul class="task-list">
            <li class="checked" data-task-id="44d95f97">task c</li>
            <li data-task-id="4aaf4bdb">task d</li>
          </ul>
        CONTENT
      )
    end

    it 'updates the tasks from the content' do
      note = build_note(
        content: '<ul class="task-list">' \
                   '<li class="checked">a</li>' \
                   '<li>b</li>' \
                 '</ul>' \
                 '<ul>' \
                   '<li>a</li>' \
                 '</ul>'
      )

      described_class.new(note).run

      allow(SecureRandom).to receive(:uuid).and_return('de509b8c', '76de3a32')

      note.content =
        '<ul class="task-list">' \
          '<li class="checked">a</li>' \
          '<li class="checked">b</li>' \
        '</ul>' \
        '<ul>' \
          '<li>a</li>' \
        '</ul>'

      described_class.new(note).run

      expect(note.tasks).to eq({ 'todo' => [], 'done' => [{ 'de509b8c' => 'a' }, { '76de3a32' => 'b' }] })
      expect(note.content).to eq(
        '<ul class="task-list">' \
          '<li class="checked" data-task-id="de509b8c">a</li>' \
          '<li class="checked" data-task-id="76de3a32">b</li>' \
        '</ul>' \
        '<ul>' \
          '<li>a</li>' \
        '</ul>'
      )
    end

    it 'keeps an existing task id' do
      note = build_note(
        uid: SecureRandom.uuid,
        user: create_user,
        content: '<ul class="task-list">' \
                   '<li class="checked" data-task-id="de509b8c">a</li>' \
                 '</ul>'
      )

      described_class.new(note).run

      expect(note.content).to eq(
        '<ul class="task-list">' \
          '<li class="checked" data-task-id="de509b8c">a</li>' \
        '</ul>'
      )
    end
  end
end

import React, { Component } from 'react';
import Navbar from './Navbar';
import ActionBar from './ActionBar';
import Flash from './Flash';
import AlertFlash from './AlertFlash';
import AutoSave from './AutoSave';
import Note from './Note';
import TaskGroup from './TaskGroup';
import SearchTerm from './SearchTerm';
import LoadMoreButton from './LoadMoreButton';
import { ajax } from './ajax';

class TaskEdit extends Component {
  constructor(props, context) {
    super(props, context);

    this.state = {
      notes: [],
      currentPage: 1,
      searchQuery: undefined,
      filter: 'todo',
      hasMorePages: false,
      isLoadingMorePages: true
    }
  }

  render() {
    return (
      <div>
        <Navbar
          isLoggedIn={true}
          handleSearchEnter={this.handleSearchEnter.bind(this)}
          handleSearchCleared={this.handleSearchCleared.bind(this)} />

        <main>
          <Flash />
          <ActionBar
            handleNewClicked={() => this.props.history.push('/notes')}
            isSynced={this.state.isSynced} />
          <div className="flex one">
            <div className="full">
              <SearchTerm searchQuery={this.state.searchQuery} />
              <div className="view-filter">
                <select name="view-filter" onChange={this.handleFilterChanged.bind(this)}>
                  <option value="todo">Show todos</option>
                  <option value="">Show all</option>
                </select>
              </div>
              {this.renderEmpty()}
              {this.state.notes.map((note) =>
                <TaskGroup
                  key={note.uid}
                  note={note}
                  handleTaskChecked={this.handleTaskChecked.bind(this)} />
              )}
              <LoadMoreButton
                showLoadMoreButton={this.state.hasMorePages}
                showSpinner={this.state.isLoadingMorePages}
                handleLoadMoreClick={this.handleLoadMoreClick.bind(this)} />
            </div>
          </div>
        </main>
      </div>
    );
  }

  componentDidMount() {
    this.autoSave = new AutoSave(this.handleServerSync.bind(this));
    this.autoSave.startPolling();
  }

  componentWillUnmount() {
    this.autoSave.stopPolling();
  }

  renderEmpty() {
    if (this.state.notes.length > 0) { return; }

    return (
      <div>There's nothing…</div>
    );
  }

  handleTaskChecked(note, task, e) {
    // update the task so the change is immediately rendered, otherwise the UI
    // updates only after the next auto poll cycle is done.
    const associatedNote= this.state.notes.find(collectionNote => collectionNote.uid === note.uid);
    const taskIndex = associatedNote.tasks.findIndex(collectionTask => collectionTask.id === task.id);
    associatedNote.tasks[taskIndex] = task;

    // create a temporary html element so we can easily query the task element
    // and toggle the checked class
    const noteContentElement = document.createElement('div');
    noteContentElement.innerHTML = note.content;
    const taskElement = noteContentElement.querySelector(`[data-task-id="${task.id}"]`);
    taskElement.classList.toggle('checked');

    associatedNote.content = noteContentElement.innerHTML;

    this.autoSave.setChange(Note.fromAttributes(associatedNote));
  }

  handleServerSync(data) {
    if (data.isSynced) {
      this.fetchTasks();
    }
    this.setState({ isSynced: data.isSynced });
  }

  handleSearchEnter(value) {
    this.setState({ searchQuery: value }, () => {
      this.fetchTasks();
    });
  }

  handleSearchCleared() {
    this.setState({ searchQuery: '' }, () => {
      this.fetchTasks();
    });
  }

  handleFilterChanged(e) {
    this.setState({ filter: e.target.value }, () => {
      this.fetchTasks();
    });
  }

  handleLoadMoreClick(e) {
    this.setState({ isLoadingMorePages: true });

    this.setState({ currentPage: this.state.currentPage + 1 }, () => {
      this.fetchTasks();
    });
  }

  fetchTasks() {
    const params = {
      search: this.state.searchQuery,
      page: this.state.currentPage
    };

    if (this.state.filter) {
      params['filters[]'] = this.state.filter;
    }

    ajax('/api/task_notes', 'GET', params)
      .then((data) => {
        this.setState({
          notes: data.notes,
          hasMorePages: data.has_more_pages,
          isLoadingMorePages: false
        });
      })
      .catch((error) => {
        AlertFlash.show('Fetching the tasks failed.');
        console.error('url: ', this.props.url, 'error: ', error.toString());
      });
  }
}

export default TaskEdit;

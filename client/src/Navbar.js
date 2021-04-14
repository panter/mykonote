import React, { Component } from 'react';
import { Link, NavLink } from 'react-router-dom';
import { debounce } from 'throttle-debounce';
import EventHive from './EventHive';
import Spinner from './Spinner';
import Logout from './Logout';

import { ReactComponent as Logo } from './images/logo.svg';
import { ReactComponent as CloseIcon } from './icons/material/close-24px.svg';

import './Navbar.css';

class Navbar extends Component {
  constructor(props, context) {
    super(props, context);

    this.state = { showSpinner: false };

    this.handleSearchEnterDebounced = debounce(500, this.handleSearchEnterDebounced);
  }

  render() {
    return (
      <nav>
        {this.renderLogo()}

        {this.props.isLoggedIn ? this.renderSearchBox() : null}

        <input id="bmenug" type="checkbox" className="show" ref={c => this.showHamburger = c} />
        <label htmlFor="bmenug" className="burger pseudo button">&#8801;</label>

        <div className="menu">
          <NavLink to="/notes" className="button pseudo">All notes</NavLink>
          <NavLink to="/task-notes" className="button pseudo">Task notes</NavLink>
          <NavLink to="/tasks" className="button pseudo">Tasks</NavLink>

          <button
            className="icon close-hamburger hidden-lg"
            onClick={this.handleCloseHamburgerClicked.bind(this)}>
            <CloseIcon />
          </button>

          {this.props.isLoggedIn ? <Logout /> : null}
        </div>
      </nav>
    );
  }

  renderLogo() {
    return (
      <Link to='/' className="brand">
        {this.state.showSpinner ? (
          <div className="logo">
            <Spinner />
          </div>
        ) : (
          <Logo className="logo" />
        )}
      </Link>
    );
  }

  componentDidMount() {
    this.subscribeSpinner();
    this.subscribeSearch();
  }

  componentWillUnmount() {
    this.unsubscribeSpinner();
    this.unsubscribeSearch();
  }

  renderSearchBox() {
    return (
      <div className="search vertically-aligned">
        <input
          type="text"
          className="search-input"
          placeholder="Search"
          onChange={this.handleSearchEnter.bind(this)}
          ref={(c) => this.searchInput = c} />
        <button
          type="button"
          className="search-clear"
          onClick={this.handleSearchCleared.bind(this)}>×</button>
      </div>
    );
  }

  getSpinnerCssClass() {
    let cssClass = 'spinner';
    if (!this.state.showSpinner) {
      cssClass += ' hidden';
    }

    return cssClass;
  }

  getLogoCssClass() {
    let cssClass = 'navbar-logo';
    if (this.state.showSpinner) {
      cssClass += ' hidden';
    }

    return cssClass;
  }

  handleSearchEnter(e) {
    e.persist();
    this.handleSearchEnterDebounced(e);
  }

  handleSearchEnterDebounced(e) {
    this.props.handleSearchEnter(e);
  }

  handleSearchCleared(e) {
    this.searchInput.value = '';
    e.target.blur();
    this.props.handleSearchCleared();
  }

  handleCloseHamburgerClicked() {
    this.showHamburger.checked = false;
  }

  subscribeSpinner() {
    // listen on global event so we can toggle the spinner from unrelated
    // components
    this.spinnerSubscription = EventHive.subscribe('spinner.toggle', (data) => {
      this.setState({ showSpinner: data.show });
    });
  }

  unsubscribeSpinner() {
    this.spinnerSubscription.remove();
  }

  subscribeSearch() {
    this.searchSubscription = EventHive.subscribe('search.focus', () => {
      this.searchInput.focus();
    });
  }

  unsubscribeSearch() {
    this.searchSubscription.remove();
  }
}

export default Navbar;

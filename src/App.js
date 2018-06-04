import React, { Component } from 'react';
import logo from './logo.svg';
import axios from 'axios';
import './App.css';

class App extends Component {
  constructor(props) {
    super(props)
    this.state = {
      fn: "",
      ln: "",
      un: "",
      em: "",
      pw: ""
    }
    this.handleInputChange = this.handleInputChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }
  handleInputChange(e) {
    const {value, name} = e.target
    this.setState({[name]: value})
  }

  handleSubmit(){
    axios.post('/auth/signup', this.state).then(response => {
      console.log(response.data)
    })
  }

  render() {
    return (
      <div className="App">
        <header className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <h1 className="App-title">Welcome to React</h1>
        </header>
          <input name="fn" onChange={this.handleInputChange} placeholder="first name"/>
          <input name="ln" onChange={this.handleInputChange} placeholder="last name"/>
          <input name="un" onChange={this.handleInputChange} placeholder="username"/>
          <input name="em" onChange={this.handleInputChange} placeholder="email"/>
          <input name="pw" onChange={this.handleInputChange} type= "password" placeholder="password"/>
          <button onClick={this.handleSubmit}>sign up!</button>
      </div>
    );
  }
}

export default App;

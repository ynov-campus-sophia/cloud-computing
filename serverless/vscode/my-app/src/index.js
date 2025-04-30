import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import App from './App';
import reportWebVitals from './reportWebVitals';
import Uploader from './components/uploader'

function HelloWorld() {
  return <h1 className="greeting">Hello, world!</h1>;
}


function MyUploaderApp(){
  return <div><Uploader /></div>
}

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <React.StrictMode>
    <HelloWorld />
    <MyUploaderApp />
  </React.StrictMode>
);
reportWebVitals();

//  https://code.visualstudio.com/docs/nodejs/reactjs-tutorial
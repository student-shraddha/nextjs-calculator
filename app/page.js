'use client'
// import Image from 'next/image'
import Layout from './components/layout.js'
import Key from './components/Key.js'
import { useState } from 'react'

export default function Home() {

  const[screen, setScreen] = useState("");
  const[operation, setOperation] = useState("");
  const[tempResult, setTempResult] = useState(0);
  const[result, setResult] = useState(0);

  function putNumbers(props){
    if (operation != ""){
      setScreen("");
      setOperation("");
      setScreen(screen.concat(props));
    }
    setScreen(screen.concat(props));
  }

  function removeNumber(){
    setScreen(screen.slice(0, -1));
  }

  function defineOperation(props){
    setOperation(props);
  }

  function removeAllNumbers(){
    setScreen("");

    if (screen == ""){
      setOperation("");
    }
  }

  function equalsTo(){

  }

  return (
    <Layout>
      <div className='flex flex-alignit-c screen'>
        <p>{screen}</p>
      </div>
      <div className='keypad'>
        <div className='flex flex-justcont-sb'>
          <Key text={7} action={() => putNumbers(7)}  classes='keys keys-numbers' />
          <Key text={8} action={() => putNumbers(8)}  classes='keys keys-numbers' />
          <Key text={9} action={() => putNumbers(9)}  classes='keys keys-numbers' />
          <Key text="DEL" action={() => removeNumber()}  classes='keys keys-delete' />
        </div>
        <div className='flex flex-justcont-sb keypad-row'>
          <Key text={4} action={() => putNumbers(4)}  classes='keys keys-numbers' />
          <Key text={5} action={() => putNumbers(5)}  classes='keys keys-numbers' />
          <Key text={6} action={() => putNumbers(6)}  classes='keys keys-numbers' />
          <Key text={"+"} action={() => defineOperation("+")}  classes='keys keys-numbers' />
        </div>
        <div className='flex flex-justcont-sb'>
          <Key text={1} action={() => putNumbers(1)}  classes='keys keys-numbers' />
          <Key text={2} action={() => putNumbers(2)}  classes='keys keys-numbers' />
          <Key text={3} action={() => putNumbers(3)}  classes='keys keys-numbers' />
          <Key text={"-"} action={() => defineOperation("-")} classes='keys keys-numbers' />
        </div>
        <div className='flex flex-justcont-sb keypad-row'>
          <Key text={"."} action={() => putNumbers(",")}  classes='keys keys-numbers' />
          <Key text={0} action={() => putNumbers(0)}  classes='keys keys-numbers' />
          <Key text={"/"} action={() => defineOperation("/")}  classes='keys keys-numbers' />
          <Key text={"x"} action={() => defineOperation("x")}  classes='keys keys-numbers' />
        </div>
        <div className='flex flex-justcont-sb'>
          <Key text={"RESET"} action={() => removeAllNumbers()}  classes='keys keys-last keys-last-reset' />
          <Key text={"="} action={() => equalsTo()}  classes='keys keys-last keys-last-equals' />
        </div>
      </div>
    </Layout>
  )
}

// import Image from 'next/image'
import Layout from './components/layout.js'
import Key from './components/Key.js'

export default function Home() {
  return (
    <Layout>
      <div className='screen'>

      </div>
      <div className='keypad'>
        <Key text = "7" classes='keys keys-numbers' />
      </div>
    </Layout>
  )
}

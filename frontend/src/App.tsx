import Login from "./page/LoginPage.tsx"
import {Route, Routes, Navigate} from "react-router-dom";
import SignUpPage from "./page/SignUpPage.tsx"

function App() {
  return(
    
    <Routes>
      <Route path="/login" element={<Login />}/>
      <Route path="/signup" element={<SignUpPage/>}/>

      <Route path="/" element={<Navigate to="/login" replace/>}/>
      <Route path="*" element={<Navigate to="/login" replace/>}/>
    </Routes>
  )
}

export default App

import Style from "./LoginPage.module.css"
import Countrylist from "./CountryList.tsx";

function Card (){

    return(
        <div className={Style.root}>
            <div className={Style.card}>
                <h2 className={Style.title}>Create Account</h2>        
                <label>Username</label>
                <input type="text" placeholder="Username"></input>
                <label>Password</label>
                <input type="password" placeholder="Password"></input>
                <label>Confirm Password</label>
                <input type="password" placeholder="Confirm Password"></input>
                <label>Region</label>
                <Countrylist></Countrylist>
                <button>Create Account</button>
                <p className={Style.signin}>
                   Already have an account?
                   <a href="#">Sign In</a> 
                </p>
            </div>
        </div>
        
    );
}

export default Card
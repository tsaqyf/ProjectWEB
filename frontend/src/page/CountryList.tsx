import Style from './CountryList.module.css'

function countrylist(){
    return(
            <select className={Style.selects}>
                <option>Please select your country</option>
                <option>China</option>
                <option>America</option>
                <option>Indonesia</option>
            </select>

    );
}

export default countrylist
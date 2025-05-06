'use client'
import { useEffect, useState } from "react";

export default function Layout({ children }){
    const [theme, setTheme] = useState("");
    
    useEffect(() => {
        const preferredTheme = window.matchMedia("(prefers-color-scheme: dark)");
        setTheme(preferredTheme ? "dark" : "light");
    }, [])

    function changeTheme(props){
        setTheme(props);
    }

    return(
        <>
            <div className={theme == "dark" ? "theme--dark" : theme == "light" ? "theme--light" : "theme--other"}>
                <main className="flex flex-justcont-c flex-alignit-c flex-dir-col">
                    <header className="flex flex-justcont-sb">
                        <p className="logo text-upper">shill</p>
                        <div className="flex flex-dir-col toggle">
                            <div className="toggle-numbers">
                                <button onClick={() => changeTheme("dark")}>1</button>
                                <button onClick={() => changeTheme("light")}>2</button>
                                <button onClick={() => changeTheme("other")}>3</button>
                            </div>
                            <div className="toggle-text-bar">
                                <p className="toggle-text">THEME</p>
                                <div className="flex flex-justcont-sb toggle-bar">
                                    <button onClick={() => changeTheme("dark")} className={theme == "dark" ? "" : "toggle-bar-hidden"}></button>
                                    <button onClick={() => changeTheme("light")} className={theme == "light" ? "" : "toggle-bar-hidden"}></button>
                                    <button onClick={() => changeTheme("other")} className={theme == "other" ? "" : "toggle-bar-hidden"}></button>
                                </div>
                            </div>
                        </div>
                    </header>
                    {children}
                </main>
            </div>
        </>
    )
}

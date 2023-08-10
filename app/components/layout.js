'use client'
import { useEffect, useState } from "react";

export default function Layout({ children }){
    const [theme, setTheme] = useState("");
    
    useEffect(() => {
        const preferredTheme = window.matchMedia("(prefers-color-scheme: dark)");
        setTheme(preferredTheme ? "dark" : "light");        
    })

    return(
        <>
            <div className={theme == "dark" ? "theme--dark" : theme == "light" ? "theme--light" : "theme--other"}>
                <main>{children}</main>
            </div>
        </>
    )
}
export default function Key({ text, classes, action }){
    return(
        <button className={classes} onClick={action}>
            <p>{text}</p>
        </button>
    )
}
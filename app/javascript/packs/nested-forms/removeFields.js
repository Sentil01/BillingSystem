class removeFields {
    constructor(){
        this.loopLinks()
    }
    loopLinks(){
        document.addEventListener('click',e=>{
            if(e.target && e.target.className == "remove_fields"){
                this.handleClick(e.target,e)
            }
        })

    }
    handleClick(link,e){
        if (!link || !e) return
        e.preventDefault()
        let parentField = link.closest(".nested-fields")
        let deleteField = parentField? parentField.querySelector('input[type="hidden"]'):null
        if(deleteField){
            deleteField.value=1
            parentField.style.display='none'
        }
}
}
window.addEventListener('turbolinks:load', () => new removeFields())
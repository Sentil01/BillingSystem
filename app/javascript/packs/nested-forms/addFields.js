class addFields{
    constructor() {
        this.links=document.querySelectorAll(".add_fields")
        this.loopLinks()
    }
    loopLinks(){
        if (this.links.length == 0) return
        this.links.forEach(link=>{
            link.addEventListener('click',e=>{
                this.handleClick(link,e)
            })
        })

    }
    handleClick(link,e){
        if (!link || !e) return
        e.preventDefault()
        let time = new Date().getTime()
        let linkId=link.dataset.id
        let regExp = linkId? new RegExp(linkId,'g') : null
        let newFields = regExp ? link.dataset.fields.replace(regExp,time) : null
        newFields ? link.insertAdjacentHTML('beforebegin',newFields) : null
    }
}
window.addEventListener('turbolinks:load', () => new addFields())
(()=>{
    let dataOddania = document.getElementsByTagName('data-oddania')[0];
    formatDateWithWeekDay(dataOddania);
})();

function formatDateWithWeekDay(element) {
    let dateString = element.innerText;
    let date = new Date(dateString);
    let localeDate = date.toLocaleDateString('pl', {weekday: 'long', day:'numeric', month:'numeric', year:'numeric'});
    element.innerText = localeDate;
}

function formatDate(element) {
    let dateString = element.innerText;
    let date = new Date(dateString);
    let localeDate = date.toLocaleDateString('pl', {day:'numeric', month:'numeric', year:'numeric'});
    element.innerText = localeDate;
}
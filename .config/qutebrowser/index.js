let search_bar_text = document.querySelector("input");
function make_link() {
    // if you self host your own search engine then uncomment the following line and put your ip and port
    // and make sure to not to remove search query
    // let search_engine = "http://<your-local-ip>:<the-port-on-which-it-is-hosted-on>/search?q=";
    let search_engine = "https://4aeb-94-29-227-225.in.ngrok.io/?q="; // -- change this
    let link = "";
    search_bar_text = search_bar_text.value.split(" ");
    for (let i = 0; i < search_bar_text.length; i++) {
	link += "+" + search_bar_text[i];
  }
    return search_engine + link;
}

search_bar_text.addEventListener("keyup",(e) => {
    if (e.keyCode === 13){
	window.location = make_link();
    }
})

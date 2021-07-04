if (location.pathname.match("items/new")||location.pathname.match("edit")){
  document.addEventListener("DOMContentLoaded", () => {
    const inputElement = document.getElementById("items_tag_tag");
    inputElement.addEventListener("keyup", () => {
      const keyword = document.getElementById("items_tag_tag").value;
      const XHR = new XMLHttpRequest();
      XHR.open("GET", `/items/search/?keyword=${keyword}`, true);
      XHR.responseType = "json";
      XHR.send();
      XHR.onload = () => {
        const searchResult = document.getElementById("search-result");
        searchResult.innerHTML = "";
        if (XHR.response) {
          const tagName = XHR.response.keyword;
          tagName.forEach((tag) => {
            const childElement = document.createElement("div");
            childElement.setAttribute("class", "child");
            childElement.setAttribute("id", tag.id);
            childElement.innerHTML = tag.tag;
            searchResult.appendChild(childElement);
            const clickElement = document.getElementById(tag.id);
            clickElement.addEventListener("click", () => {
              document.getElementById("items_tag_tag").value = clickElement.textContent;
              clickElement.remove();
            });
          });
        };
      };
    });  
  });
};
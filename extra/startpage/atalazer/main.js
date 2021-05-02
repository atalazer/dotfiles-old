// Greet settings
const TITLE = document.querySelector(".greet");
const USER = "Atalariq";

// Search settings
// const searchUrl = "https://google.com/search?q=";           // Google
const searchUrl = "https://duckduckgo.com/?q=";           // Duckduckgo

// Weather settings
const myWeatherApiKey = "8f867e7b117a4eb09af8a54b0be530c2";
const myLocation = "1648084";
const myUnit = "metric";

const getGreet = () => {
    const date = new Date();
    const time = date.getHours();

    if (time >= 0 && time <= 10) return "Good Morning"   + " " + USER;
    if (time > 10 && time <= 14) return "Good Afternoon" + " " + USER;
    if (time > 14 && time <= 17) return "Good Evening"   + " " + USER;
    if (time > 17 && time <= 21) return "Good Night"     + " " + USER;
    if (time > 21 && time <= 23) return "Good Midnight"  + " " + USER;
}
TITLE.innerHTML = getGreet();

// Search on enter key event
function search(e) {
    if (e.keyCode == 13) {
        var val = document.getElementById("search-field").value;
        window.open(searchUrl + val);
    }
}
// Handle Weather request
const getUnits = () => {
    if ( myUnit == "metric"   ) { return " C"; }
    else if ( myUnit == "imperial" ) { return " F"; }
    else { return " C"; }
}

function getWeather() {
    let xhr = new XMLHttpRequest();
    // Request to open weather map
    xhr.open(
        "GET",
        "http://api.openweathermap.org/data/2.5/weather?id=" + myLocation + "&units=" + myUnit + "&appid=" + myWeatherApiKey
    );
    xhr.onload = () => {
        if (xhr.readyState === 4) {
            if (xhr.status === 200) {
                let json = JSON.parse(xhr.responseText);
                document.getElementById("temp").innerHTML =
                    json.main.temp.toFixed(0) + getUnits();
                    // json.main.temp.toFixed(0) + " C";
                document.getElementById("weather-description").innerHTML =
                    json.weather[0].description;
            } else {
                console.log("error msg: " + xhr.status);
            }
        }
    };
    xhr.send();
}
// Handle writing out Bookmarks
function setupBookmarks() {
    const bookmarkContainer = document.getElementById("bookmark-container");
    bookmarkContainer.innerHTML = bookmarks
        .map((b) => {
            const html = ["<div class='bookmark-set'>"];
            html.push(`<div class="bookmark-title">${b.title}</div>`);
            html.push('<div class="bookmark-inner-container">');
            html.push(
                ...b.links.map(
                    (l) =>
                    `<a class="bookmark" href="${l.url}" target="_self">${l.name}</a>`
                )
            );
            html.push("</div></div>");
            return html.join("");
        })
        .join("");
}

window.onload = () => {
    setupBookmarks();
    getWeather();
};

document.addEventListener("keyup", (event) => {
    if (event.keyCode == 32) {
        // Spacebar code to open search
        document.getElementById("search").style.display = "flex";
        document.getElementById("search-field").focus();
    } else if (event.keyCode == 27) {
        // Esc to close search
        document.getElementById("search-field").value = "";
        document.getElementById("search-field").blur();
        document.getElementById("search").style.display = "none";
    }
});


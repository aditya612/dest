// chrome.action.onClicked.addListener(function () {
//     chrome.tabs.create({ 'url': "chrome://newtab" })
// })

// chrome.action.onClicked.addListener(function (tab) {
//     chrome.tabs.create({
//         url: chrome.extension.getURL('index.html'),
//         selected: true,
//     })
// })

chrome.runtime.onInstalled.addListener((reason) => {
    if (reason === chrome.runtime.OnInstalledReason.INSTALL) {
        chrome.tabs.create({
            url: 'index.html'
        });
    }
});
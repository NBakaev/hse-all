function isUndefinedOrNull(obj) {
    if (obj === null || typeof obj === "undefined") return true;
    return false;
}

function isUndefinedOrNullOrEmpty(obj) {
    if (obj === null || typeof obj === "undefined" || obj === "") return true;
    return false;
}
const arrayNumbers = [10, 30, 9, 7, 15];

Array.prototype.sortNumbers = function (order = "asc") {
  return this.sort(function (a, b) {
    switch (order) {
      case "asc":
        return a - b;
      case "desc":
        return b - a;
    }
  });
};

console.log(arrayNumbers.sortNumbers());
console.log(arrayNumbers.sortNumbers("desc"));

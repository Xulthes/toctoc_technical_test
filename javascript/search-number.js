const numbers = [1, 3, 6, 90, 39, 4];

const searchNumber = (number) => {
  return numbers.includes(number);
};

console.log(searchNumber(88));
console.log(searchNumber(39));

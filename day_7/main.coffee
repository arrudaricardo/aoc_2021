fs = require 'fs'
input = 'input.txt'

file = fs.readFileSync input, 'utf8' 
inputs = file.split(",").map (v) -> (Number) v


sum = inputs.reduce (x, y) -> x + y
inputs.sort (a,b) -> a - b

mean = inputs[Math.floor inputs.length / 2]
average =  Math.ceil inputs.reduce (x, y) -> (x + y / inputs.length)
average -= 1

fuel1 = inputs.map (x) ->  Math.abs mean - x
sumFuel = fuel1.reduce (x, y) -> x + y

console.log "Solution 1: #{sumFuel}"

# Part 2  
sumFuel2 = 0
for input in inputs
  steps = Math.abs input - average 
  x = [1..steps].reduce (x, y) -> x + y
  sumFuel2 += x

console.log "Solution 2: #{sumFuel2}"
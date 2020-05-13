
function main(){
  var fruit = new apple()
  console.log(fruit)
}

var banana = {
  name: 'banana'
}

function apple(){
  this.name = 'apple'
  return banana
}

main()
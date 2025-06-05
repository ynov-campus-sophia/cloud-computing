function main(args) {
    let name = args.name || 'Sacha'
    let greeting = 'Hello ' + name + '!'
    console.log(greeting)
    return {"body": greeting}
  }

exports.main = main
const osc = require('osc-min')

const sock = udp.createSocket("udp4", function(msg, rinfo) {
  try {
    return console.log( osc.fromBuffer( msg ) )
  } catch (error) {
    return console.log( "installnvalid OSC packet", error )
  }
})

sock.bind(8000)
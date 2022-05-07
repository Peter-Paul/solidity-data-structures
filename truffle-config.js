module.exports = {
  networks: {
    development: {
      host: "127.0.0.1", // local host
      port: 7545, // port ganache is running on. If yours is different, change it
      network_id: "*" // Match any network id
    }
  },
  solc: {
    optimizer: {
      enabled: true,
      runs: 200
    }
  }
}

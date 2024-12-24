import { vars, HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox-viem";

const config: HardhatUserConfig = {
  solidity: "0.8.27",
  networks: {
    // goerli: {
    //   url: vars.get("GOERLI_URL"),
    //   accounts: [vars.get("PRIVATE_KEY")],
    // },
    // sepolia: {
    //   url: vars.get("SEPOLIA_URL"),
    //   accounts: [vars.get("PRIVATE_KEY")],
    // },
    // mainnet: {
    //   url: vars.get("MAINNET_URL"),
    //   accounts: [vars.get("PRIVATE_KEY")],
    // },
  },
};

export default config;

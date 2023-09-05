import {InjectedConnector, injectedConnector} from '@web3-react/injected-connector';

export const injected = new InjectedConnector({
    supportedChainIds: [1, 31337] // chain ID 지정
})
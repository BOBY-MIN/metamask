import { useWeb3React } from "@web3-react/core";
import { useEffect, useState } from "react";
import styled from "styled-components";
import {wait} from "@testing-library/user-event/dist/utils";
import {ethers} from "ethers";

const StyledWalletStatusDiv = styled.div`
    display: flex;
    gap: 20px;
`;


const ChainId = () => {
    const { chainId } = useWeb3React();

    return (
        <>
            <span>Chain Id</span>
            <span>{chainId}</span>
        </>
    );
}

const BlockNumber = () => {
    const { chainId, library } = useWeb3React();

    const [ blockNumber, setBlockNumber ] = useState();

    useEffect(() => {
        if (!library) return;

        let stale = false;
        const getBlockNumber = async () => {
            try {
                const blockNumber = await library.getBlockNumber();
                if(!stale) setBlockNumber(blockNumber);
            } catch(error) {
                console.log('debug___', error);
            }
        }

        getBlockNumber();
        library.on('block', setBlockNumber);

        return () => {
            stale = true;
            library.removeListener('block', setBlockNumber);
            setBlockNumber(undefined);
        }
    }, [library, chainId]);

    return (
        <>
            <span>Block Number :</span>
            <span>{blockNumber}</span>
        </>
    );
}

const Account = () => {
    const { account } = useWeb3React();

    return (
        <>
            <span>Account :</span>
            <span>{account ? `${account.substring(0, 6)} ... ${account.substring(account.length - 6)}` : ''}</span>
        </>
    );
}

const Balance = () => {
    const { account, library, chainId } = useWeb3React();
    const [ balance, setBalance ] = useState();

    useEffect(() => {
        if(typeof account === 'undefined' || account === null || !library){
            return;
        }

        let stale = false;

        const getBalance = async () => {
            try {
                const balance = await library.getBalance(account);
                if(!stale) setBalance(balance);
            } catch(error) {
                console.log('debug___', error);
            }
        }

        getBalance();

        library.on('block', getBalance);

        return () => {
            stale = true;
            library.removeListener('block', getBalance);
            setBalance(undefined);
        }
    }, [account, library, chainId]);

    return(
        <>
            <span>Balance :</span>
            <span>{balance ? `${ethers.utils.formatEther(balance)} ETH` : ''}</span>
        </>
    );
}

const NextNonce = () => {
    const { account, library, chainId } = useWeb3React();
    const [nextNonce, setNextNonce] = useState();

    useEffect(() => {
        if(typeof account === 'undefined' || account === null || !library){
            return;
        }

        let stale = false;

        const getNextNonce = async () => {
            try {
                const nextNonce = await library.getTransactionCount(account);
                if(!stale) setNextNonce(nextNonce);
            } catch(error) {
                console.log('debug___', error);
            }
        }
        getNextNonce();

        library.on('block', getNextNonce);

        return () => {
            stale = true;
            library.removeListener('block', getNextNonce);
            setNextNonce(undefined);
        }
    }, []);

    return(
        <>
            <span>NextNonce :</span>
            <span>{nextNonce ? nextNonce : ''}</span>
        </>
    );
}

export function WalletStatus() {
    return (
        <StyledWalletStatusDiv>
            <ChainId />
            <BlockNumber />
            <Account />
            <Balance />
            <NextNonce />
        </StyledWalletStatusDiv>
    );
}
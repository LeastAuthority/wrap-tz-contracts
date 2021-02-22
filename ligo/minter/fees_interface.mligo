type distribute_param = 
[@layout:comb]
{
    signers: key_hash list;
    tokens: (address * nat) list;
}

type withdraw_tokens_param = 
[@layout:comb]
{
    fa2: address;
    tokens: nat list;
}

type withdraw_token_param = 
[@layout:comb]
{
    fa2: address;
    token_id: nat;
    amount: nat;
}

type set_signer_payment_address_param =
[@layout:comb]
{
    signer: key_hash;
    payment_address: address;
}

type withdrawal_entrypoint = 
| Withdraw_all_tokens of withdraw_tokens_param
| Withdraw_all_xtz
| Withdraw_token of withdraw_token_param
| Withdraw_xtz of tez

type quorum_fees_entrypoint =
| Set_signer_payment_address of set_signer_payment_address_param
| Distribute_tokens of distribute_param
| Distribute_xtz of key_hash list

type fees_entrypoint = 
| Withdraw of withdrawal_entrypoint
| Quorum_ops of quorum_fees_entrypoint
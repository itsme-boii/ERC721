module Oasis::Oasis{

        use sui::tx_context::TxContext;
        use sui::tx_context ;
        use sui::object::{Self, UID};
        use std::string::String;
        use std::vector;
        use sui::address;
        use sui::transfer;
        use sui::dynamic_object_field as ofield;


        struct Data has key {
            id:UID
        }


    // this is the struct for the nft
        struct Nft has key,store{
            name:String;
            symbol:String;
            description:description;
            traitType:value;
            owner:address;
        }


    // // this is the struct for the publicmint
    //     struct PublicMint has key,store{
    //         id:UID,
    //         mintPrice:u64,
    //         amountPerWallet:u64,
    //         royalWallet:address,
    //         royalities:u64
    //     }


    // // this is the struct for presale
    //     struct Presale has key, store{
    //         id:UID,
    //         mintPrice:u64,
    //         amountPerWallet:u64,
    //         whitelistedAddress:vector<address>
    //     }

        
    // // this is the struct for multiplestakeholder
    //     struct MultipleStakeholder has key,store{
    //         id:UID,
    //         // percent:vector<SimpleMap<address,u64>>
    //     }


    // this is the struct for vector
        struct Vector has store,key{
            id:UID,
            name:String,
            owner:address,
            store:vector<Nft>
        }

    // this is to make a parent class for my nft
        fun init(ctx: &mut TxContext){
            let data = Data{
                id:object::new(ctx)
            };
            transfer::share_object(data);

        }

    // this is to mint and nft as required    
        public fun nftData(
            name:String;
            symbol:String;
            description:description;
            traitType:value;
            // publicMint:bool,
            // preSale:bool,
            // multipleStakeholder:bool,
            ctx:&mut TxContext)
            {
            let sender_address = tx_context::sender(ctx);
            let nft = Nft{
                name:String;
            symbol:String;
            description:description;
            traitType:value;
                // publicMint:publicMint,
                // preSale:preSale,
                // multipleStakeholder:multipleStakeholder,
            owner:tx_context::sender(ctx)
            };
            transfer::transfer<Nft>(nft,sender_address);

        }

    // create user and then add to to parent data with the name as its key
        public fun createUser(data:&mut Data,name:String,ctx:&mut TxContext){
            let user = Vector{
                id:object::new(ctx),
                name:name,
                owner:tx_context::sender(ctx),
                store:vector::empty<Nft>()
            };
            ofield::add(&mut data.id, name , user);
        }

    // so far we have created the nft and then added to a parent data so that everyone have access to the data

    // call this function when public mint is active in frontend
    //     public fun publicMint(
    //         mintPrice:u64,
    //         amountPerWalet:u64,
    //         royalWallet:address,
    //         royalities:u64,
    //         nft:&mut Nft,
    //         ctx:&mut TxContext
    //     ){
    //         let publicMint = PublicMint{
    //             id:object::new(ctx),
    //             mintPrice:mintPrice,
    //             amountPerWallet:amountPerWalet,
    //             royalWallet:royalWallet,
    //             royalities:royalities
    //         };
    //         ofield::add(&mut nft.id,b"publicMint",publicMint);

    //     }

    // // call this function when presale is set to true in frontend
    //     public fun preSale(
    //         mintPrice:u64,
    //         amountPerWalet:u64,
    //         whitelistedAddress:vector<address>,
    //         nft:&mut Nft,
    //         ctx:&mut TxContext
    //     ){
    //         let preSale = Presale{
    //             id:object::new(ctx),
    //             mintPrice:mintPrice,
    //             amountPerWallet:amountPerWalet,
    //             whitelistedAddress:whitelistedAddress
    //         };
    //         ofield::add(&mut nft.id,b"PreSale",preSale);
    //     }

        // public fun make_vector(){


        //     // write a function to get tge vectors nft in a vector store that can be called from front end
            

        // }


}
import { wrapFunction } from "do-functions"

async function logic(){
    return "hello world"
}

export const main = wrapFunction(logic)
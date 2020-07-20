let element1 = document.querySelector('#array')

function solution(A) {

    let comparison = [],
        x = 0,
        y = A.length - 1

    for (let item of A) {

        if(!comparison.length) {
            comparison.push(item)
        } else {
            for(let i in comparison) {
                x++                
                if(item == comparison[i]) { 
                    comparison.splice(i, 1)
                } else if(x !== y){ 
                    comparison.push(item)
                }
            }            
        } 
    }
    return comparison
}

function main() {
    var arr = [9,3,9,3,9,7,9]
    
    element1.innerText = 'Unpaired value(s): ' + solution(arr)
}

main()
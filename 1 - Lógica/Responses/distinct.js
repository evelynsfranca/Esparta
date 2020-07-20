let element2 = document.querySelector('#distinct')

function solution(A) {
    
    let distinct = (value, index, arr) => {
        return arr.indexOf(value) === index
    }

    let totalDistinct = A.filter(distinct).length
        
    return totalDistinct
}
      
function main() {
    let arr = [2,1,1,2,3,1]

    element2.innerText = 'Total of distinct numbers: ' + solution(arr)
}

main()
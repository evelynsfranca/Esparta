let element3 = document.querySelector('#euclidean')

function solution(n, m) {
    
    let nextChoco = 0,
        totChocos = [],
        wrappers = m

    for(i = 0; i < n; i++) {
        
        if (i == 0){
            totChocos.push(i)
        } else if(i > 0) {
            nextChoco = (nextChoco + m) % n
            totChocos.push(nextChoco)            
        }
        
        wrappers--
        
        if(wrappers < 0) { break }
        
    }

    return totChocos.length
}

element3.innerText = 'Total chocolates: ' + solution(10, 4)
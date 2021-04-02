num.Trees <- function(n, s)
# s es el número de secuencias alinedas incialmente (número de especies inicial)
# n es el número de especies a añdir al árbol
{
	T1 <- 3
	for(i in 4:n){ T1[i-2] <- T1[i-3]*(2*n-5) }
	print("Sin raíz:")
	if(s==2){ print(2*T1[n-2]) }else{ print(T1[n-2]) }
	T2 <- 3 
	for(i in 4:n){ T2[i-2] <- T2[i-3]*(2*n-3) }
	print("Con raíz:")
	if(s==2){ 2*T2[n-2] }else{ T2[n-2] }
}

num.Trees(10)
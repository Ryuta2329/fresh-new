num.Trees <- function(n, s)
# s es el n�mero de secuencias alinedas incialmente (n�mero de especies inicial)
# n es el n�mero de especies a a�dir al �rbol
{
	T1 <- 3
	for(i in 4:n){ T1[i-2] <- T1[i-3]*(2*n-5) }
	print("Sin ra�z:")
	if(s==2){ print(2*T1[n-2]) }else{ print(T1[n-2]) }
	T2 <- 3 
	for(i in 4:n){ T2[i-2] <- T2[i-3]*(2*n-3) }
	print("Con ra�z:")
	if(s==2){ 2*T2[n-2] }else{ T2[n-2] }
}

num.Trees(10)
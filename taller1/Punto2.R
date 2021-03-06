#Punto 2 A

a1<-c(1,2,3) 
a2<-c(5,6,7)
a3<-c(9,10,11)
a<-c(a1,a2,a3)

m<-matrix(a,ncol=3,byrow=F)
m

c1<-c(0,0,0)
c2<-c(0,0,0)
c3<-c(0,0,0)
c<-c(c1,c2,c3)


m<-matrix(a,ncol=3,byrow=F)

Q<-matrix(c,ncol=3,byrow=F)

R<-matrix(c,ncol=3,byrow=F)

qr <− function (m, Q, R)
{
  V <− m
  n <− nrow(m)
  cols <− ncol(m)
  for ( i in 1:n){
    R[i,i]<− 0
    for ( j in 1:n ) {
      R[i,i] = R[i,i] + (V[j,i])^2
     
    }
    R[i,i]<−sqrt(R[i,i])
    for ( j in 1:n) {
      Q[j,i]<− V[j,i]/R[i,i]
    }
    z<−i+1
    while (z<= n) {
      R[i,z]<− 0
      for(k in 1 : cols ) {
        R[i,z]<− R[i,z] + Q[k,i] %∗%V[k,z]
      }
      for(k in 1:cols) {
        V[k,z]<− V[k,z] − R[i,z]%∗%Q[k,i]
      }
      z <− z + 1
    }
  }
  return ( R )
}

sumatoria<- function (total)
{
  w<-total
  filas <− nrow(total)
  columnas <− ncol(total)
  resultado <-0
  for(i in 1:filas)
  {
    for ( j in 1:columnas)
    {
      resultado = w[j,i] + resultado
    }
  }
  return(resultado)
}

total<-qr(m,Q,R)

res<-sumatoria(total)


#Punto 2B

puntob<- function(u)
{
  resultado = (u*(u+1)*(2*(u)+1))/6
  plot(resultado)
  return (resultado)
 
}

v<-puntob(6)
x<-puntob(7)
y<-puntob(10)


graficademier=c(v,x,y)
plot(graficademier,type="l")

#Punto 2C

library(boot)

expresion1=expression(6+(2.13*(t^2))-(0.0013*(t^4)))

a<-D(expresion1,"t")
a
#hallamos el valor del tiempo en la altura maxima con la derivada despejando
t<- function (a)
{
  Resultado<- sqrt(4.26/0.0052)
  return (Resultado)
}

z<-t(a)
z
p<- function(x) {
  
  return (6+(2.13*(x^2))-(0.0013*(x^4)))
  
}
#Utilizando el resultado de la derivada anterior
p(z)
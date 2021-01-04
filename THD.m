function Result = THD(vetor,ciclos,ord_harm,inicio,passo,fn)

% numero de ciclos que serão avaliados
% limite da ordem harmonica que deseja-se usar
% inicio do ciclo (começa do 0)

ni=size(0:passo:inicio/fn); % posiçao no vetor para inicio da analise
nf=size(0:passo:(inicio/fn+ciclos/fn)); % posiçao no vetor para fim da analise
Iab=vetor(ni(2):nf(2)); % corta o vetor de tensao na regiao desejada
Y = fft(Iab); % realiza a transformada discreta de Fourier
m = abs(Y)/max(abs(Y)); % normaliza a transformada
mod=abs(Y)/length(Y)*2; % apresenta os valores dos coeficientes 

amplitude_inteiras = m(ciclos+1:ciclos:ciclos*ord_harm+1); % possui as 
freq = (1:length(amplitude_inteiras)); % vetor com os valores

tensao=mod(ciclos+1:ciclos:ciclos*ord_harm+1); % coloca os coeficientes das


THD_c=0; % IEEE
for ii=2:length(tensao)
THD_c = THD_c + (tensao(ii)^2);
end
THD_c = sqrt(THD_c)/tensao(1)*100;
d_IEEE = THD_c;

Result = {freq,tensao,d_IEEE} ;

end
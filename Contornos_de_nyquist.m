imaginarios = false;
figure;

%Cosas funcion de transferencia
num = [4, 5, 6];
den = [1, 0, 4];%den = [1, 2, 3];
G = tf(num, den);
polos = pole(G);
ceros = zero(G);
polos_y_ceros = [polos; ceros];
disp(polos_y_ceros);
plot(real(polos_y_ceros), imag(polos_y_ceros), 'o');
hold on;
%---------------

%Determina cual es el polo mas lejano para considerar un contorno + grande
%Genera el angulo y los puntos de aproximacion, asi como los puntos sobre
%el eje imaginario del contorno inicial
centro = 0;
radio = 1;
for i = 1:length(polos_y_ceros)
    distancia = abs(polos_y_ceros(i));
    if distancia > radio
        radio = distancia + 1;
    end
end
angulos = linspace(-pi/2, pi/2, 100);
z = radio * exp(1i * angulos) + centro;
z_eje_imaginario = 1i * linspace(-radio, radio, 100);
%----------------

%Circunferencias chiquitas, crea un arreglo z2_cell donde para cada
%polo se revisa si esta o no sobre el eje imaginario y si lo esta crea una
%circunferencia chiquita de radio 0.2. Los puntos sobre el eje imaginario
%que se encuentren dentro de la circunferencia se sacan del conjunto de
%puntos y se reemplazan por el contorno de puntos de la circunferencia que
%tengan parte real positiva
z2_cell = cell(1, length(polos_y_ceros));
for i = 1:length(polos_y_ceros)
    raiz = polos_y_ceros(i);
    if real(raiz) == 0 && imag(raiz) ~= 0
        imaginarios = true;
        radioExclusion = 0.1;
        centro = raiz;
        angulos2 = linspace(-pi/2, pi/2, 10);
        z2 = radioExclusion * exp(1i * angulos2) + centro;
        z_eje_imaginario = z_eje_imaginario(abs(z_eje_imaginario - raiz) > radioExclusion);
         z2_cell{i} = z2;
    end
end
Ztotal = cat(2, z2_cell{:});
%----------------
z = [z,Ztotal];
%Contorno de Nyquist, Si no tiene polos o ceros sobre el eje imaginario, no
%se complica y usa nyquist (Hace el trabajo solo) si tiene polos o ceros
%sobre el eje imaginario entonces hace un mapeo manual del contorno
%creado antes y lo grafica
if imaginarios
    %...
    y = polyval(num, z) ./ polyval(den, z);
    znew = y;
    plot(real(y), imag(y), 'x');
    hold on;
    %...
    disp("ey!");
else
    for i = 1:length(polos_y_ceros)
        distancia = abs(polos_y_ceros(i));
        if distancia > radio
            radio = distancia + 1;
        end
    end
    angulos = linspace(-pi/2, pi/2, 100);
    z = radio * exp(1i * angulos) + centro;
    z_eje_imaginario = 1i * linspace(-radio, radio, 100);
    nyquist(G);
    hold on;
end
z = [z, z_eje_imaginario];
plot(real(z), imag(z), '.');
%----------------
axis equal; 
title('Contorno de nyquist');
xlabel('Parte Real');
ylabel('Parte Imaginaria');
xlim([-10, 10]);
ylim([-6, 6]);
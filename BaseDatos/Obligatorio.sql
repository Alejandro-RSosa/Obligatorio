use master
go

if exists(select * from sysdatabases where name = 'Obligatorio')
begin
	drop database Obligatorio
end
go

create database Obligatorio
on(
	name = Obligatorio,
	filename = 'C:\Obligatorio\Obligatorio.mdf'
)
go

use Obligatorio
go

-- TABLAS

create table Periodistas
(
	CodPeri int not null primary key check(CodPeri > 0),
	Nombre varchar(30) not null,
	Apellido varchar(30) not null,
	Correo varchar(30) not null
)
go

create table Secciones
(
	CodSec varchar(3) not null primary key check(CodSec like '[A-Z][A-Z][A-Z]'),
	Nombre varchar(30) not null
)

go

create table Noticias
(
	CodNoti int not null identity primary key,
	FechaHora datetime not null check(FechaHora <= GETDATE()),
	Titulo varchar(30) not null,
	Resumen varchar(100) not null,
	Contenido nvarchar(max) not null,
	CodPeri int not null foreign key references Periodistas(CodPeri)
)
go


create table Nacionales
(
	CodNoti int not null foreign key references Noticias(CodNoti),
	CodSec varchar(3) not null foreign key references Secciones(CodSec),
	primary key(CodNoti)
)
go

create table Internacionales
(
	CodNoti int not null foreign key references Noticias(CodNoti),
	Pais varchar(30) not null,
	primary key (CodNoti)
)
go


-- DATOS DE PRUEBA

insert Periodistas values	(1, 'Pedro', 'Sanchez', 'pedros@gmail.com'),
							(2, 'Pablo', 'Rodriguez', 'pirri@hotmail.es'),
							(3, 'Jose', 'Duarte', 'elmagico@gmail.com'),
							(4, 'Carlos', 'Primus', 'lapauta@delapalta.com'),
							(5, 'Maximiliano', 'Mendieta', 'elbuda@supervisor.com'),
							(6, 'Jacinto', 'Estramil', 'jacinsaurio@gmail.com'),
							(7, 'Andres', 'Puentes', 'pelado@senior.com'),
							(8, 'Marcelo', 'Fernandez', 'elmamareda@deljefe.com'),
							(9, 'Gonzalo', 'Dutra', 'eldrones@flying.com'),
							(10, 'Pablo', 'Guerrero', 'eldolores@gmail.com')
go

insert Secciones Values		('POL', 'Policial'),
	                        ('ECO', 'Economia'),
	                        ('DEP', 'Deporte'),
	                        ('SOC', 'Social'),
	                        ('SAL', 'Salud'),
	                        ('ESP', 'Espectaculo'),
	                        ('AGR', 'Agro'),
	                        ('TEC', 'Tecnologia'),
	                        ('MET', 'Meteorologica'),
	                        ('ART', 'Arte'),
	                        ('PLA', 'Politica')
go

insert Noticias	values	('24/09/2021 16:10', 'Volc�n de La Palma', 'El comit� de crisis asegura que es un fen�meno normal',	'El cono principal del volc�n de La Palma ha sufrido durante la ma�ana de este s�bado una rotura parcial, seg�n ha anunciado Carlos Lorenzo, ge�logo del Instituto Geol�gico y Minero de Espa�a (IGME). El ge�logo ha asegurado, tras observar el estado mediante drones, que este fen�meno ha dejado �una colada enorme de bloques muy grandes desplazados por la ladera del cono en direcci�n al mar�. El director t�cnico del comit� de crisis, Miguel �ngel Morcuende, ha restado importancia al fen�meno. �El cono no soporta su propio peso y tambi�n debido a las deflagraciones de ayer busca poder sostenerse, pero no ha tenido mayor importancia�, ha dicho. Todo el material derruido de esta boca principal se estar�a deslizando por la colada primigenia, ha explicado Morcuende, �evacuando los trozos que ha roto de la propia estructura y le cuesta mucho avanzar�. M�S INFORMACI�N Adem�s, el director t�cnico ha se�alado la existencia de un nuevo centro emisor en la misma fisura, por encima de Monta�a Rajada, que hab�a comenzado a emitir materiales al oeste del cono principal. Los cient�ficos que siguen la erupci�n creen que podr�a tratarse de una de las primeras bocas que se abrieron en las primeras horas de la crisis que ha vuelto a emitir despu�s de un periodo apagado. �No genera inquietud�, ha tranquilizado Morcuende.', 1)
go

insert Internacionales values (IDENT_CURRENT('Noticias'), 'Espa�a')
go

insert Noticias values ('25/09/2021 04:00', 'Mides informe cr�tico', 'El trabajo del grupo Red Calle, de junio de 2018', 'En una charla con organizaciones sociales, una directora del Ministerio de Desarrollo Social (Mides) se enter� de la existencia de un informe de �diagn�stico, recomendaciones y sugerencias� realizado por Red Calle, un grupo que analiza pol�ticas de atenci�n a las personas en situaci�n de calle y que es integrado por Uruguay, Costa Rica, Chile, Brasil, Colombia y Paraguay. Cuando lo revisaron, vieron que este era profundamente cr�tico con algunos de los aspectos de la gesti�n del Frente Amplio liderada por Marina Arismendi.	El trabajo, que es de junio de 2018, expone varios cambios que se entend�a que deber�an ser implementados en el Mides. El actual jerarca de la cartera, Mart�n Lema, dijo el jueves en Comisi�n de Presupuesto Integrada con Hacienda de la C�mara de Senadores que ese material hubiera sido �til para generar pol�ticas para esa poblaci�n y sostuvo que algunas de las recomendaciones -aunque sin conocerlas por el documento- se estaban implementando ahora.', 2)
go

insert Nacionales values (IDENT_CURRENT('Noticias'), 'SOC')
go

insert Noticias values ('23/09/2021 13:25:30', 'Pinocho Sosa',	'Intuici�n, pasi�n y emoci�n',	'El parodista. El productor. El director. El cantante de cumbia. La figura indiscutible. El polemista. El tribunero. El que hac�a sentir parte a todos los que llegaban a un ensayo de Z�ngaros. El que impulsaba carreras. El empresario. El loco. El odiado, el m�s odiado. El amado, el m�s amado de todos. El �nico. Ayer muri� Ariel Sosa, Pinocho, tras varios d�as de internaci�n por la agudizaci�n del c�ncer que le hab�an diagnosticado en 2019. Ten�a 58 a�os (cumpl�a 59 el 1 de octubre) y de esos, pas� 40 inmerso en el mundo del carnaval. �Dejo mi vida en esto�, dijo en febrero en su �ltima entrevista con S�bado Show. En los hechos, lo demostr� en cada escenario que pis�, en cada tablado que llen� de una energ�a desbordante y emotiva.', 3)
go

insert Nacionales values (IDENT_CURRENT('Noticias'), 'SOC')
go

insert Noticias values ('20/09/2021 15:00', 'La Casa Blanca', 'Dice que se trata de un tr�mite, pero quedan pocos d�as para que el Congreso evite una cat�strofe.',	'La Casa Blanca inform� a las agencias gubernamentales que deben prepararse para un posible cierre del Gobierno federal si no se firma un proyecto de ley presupuestario de emergencia antes del 30 de septiembre. �Estamos tomando todas las medidas posibles para mitigar el impacto de un posible cierre�, dijo la secretaria de prensa de la Casa Blanca, Jen Psaki, durante una sesi�n informativa el jueves.	Todav�a no hay una decisi�n formal, pero es �s�lo un recordatorio de que estamos a siete d�as y tenemos que estar preparados, por supuesto, en cualquier caso de cualquier contingencia, por lo que vemos esto como un paso de rutina que es s�lo para estar preparados�, dijo Psaki.',3)
go

insert Internacionales values (IDENT_CURRENT('Noticias'), 'EEUU')
go

insert Noticias values ('13/08/2018 09:05', 'Se va construir un sistema', 'Se realiz� un taller interinstitucional, para trabajar en el Sistema Nacional Rural ', 'El taller que inicia este proyecto se realiz� en la sala de conferencias de la Rural del Prado, este jueves 23, encabezado por el ministro de Ganader�a Agricultura y Pesca, Fernando Mattos, junto con el subsecretario de la cartera, Juan Ignacio Buffa; el presidente del Instituto Nacional de la Leche, Juan Daniel Vago; el titular del Instituto Nacional de Investigaci�n Agropecuaria, Jos� Bonica; el presidente del Instituto Plan Agropecuario, Esteban Carriquiry, y el presidente del Instituto Nacional de Colonizaci�n, Julio C�sar Cardozo. En su oratoria, al finalizar la jornada de trabajo, el ministro Mattos subray� que hay sectores que requieren de las pol�ticas p�blicas para que no se ampl�e la brecha entre productores exitosos y �los que quedan en el camino�, en referencia a quienes deben abandonar el medio rural. Se�al� que Uruguay atraves� por un proceso que, por un lado, increment� la producci�n de bienes y, por otro, concentr� la propiedad de la tierra y expuls� a residentes del campo hacia las ciudades.',7)
go

insert Nacionales values (IDENT_CURRENT('Noticias'), 'SOC')
go

insert Noticias values ('30/05/2015 05:00', 'El exitoso mercado de un ni�o', 'En la Venezuela de la escasez, el adolescente Andr�s L�pez desaf�a la precariedad con ingenio.', 'Tiene solo 14 a�os, pero ma�a de sobra. Con sus manos ensambla chanclas, "cholas", como se les llama en Venezuela, vali�ndose de materiales desechados.  Para la suela utiliza caucho de neum�ticos. Primero descuartiza, luego moldea. Cose con agujas extra�das de tacones de mujer. Es un trabajo minucioso. "Hab�a gente aqu�, en Ciudad Bol�var, que ya las hac�a. Pero les quedaban torcidas. A m� me quedan derechas", dice, con satisfacci�n, a BBC Mundo. Ciudad Bol�var es la capital del estado de Bol�var, localizado al sureste de Venezuela. Como casi todo el pa�s, la ciudad sufre los estragos de la hiperinflaci�n, la falta de acceso a d�lares, moneda que de facto permite sobrevivir, y el elevado precio de productos b�sicos.',5)
go

insert Internacionales values (IDENT_CURRENT('Noticias'), 'Venezuela')
go

insert Noticias values ('30/05/2015 05:00',	'La LUC no es para el FA',	'El coordinador del FA dijo que el refer�ndum contra la LUC', '�No est� en discusi�n en el Congreso. El tema de la LUC  (Ley de Urgente Consideraci�n) no es para el Frente una evaluaci�n del gobierno a mitad de camino. Es un tema mayor para el pa�s y as� se encara� dijo esta ma�ana Ricardo Ehrlich, coordinador del FA,  luego de una recorrida por las comisiones que trabajan de cara al Congreso del Frente Amplio de este fin de semana. Ehrlich fue consultado por las cr�ticas de la oposici�n a las dos interpelaciones realizadas esta semana a los ministros Heber y Garc�a. Desde el oficialismo se acus� de usar las interpelaciones para fortalecer la campa�a de refer�ndum para derogar 135 art�culos de la LUC. ',8)
go

insert Nacionales values (IDENT_CURRENT('Noticias'), 'PLA')
go

insert Noticias values ('30/05/2015 05:00',	'Nuevas reglas en el puerto', 'La ANP determin� el traspaso del primer servicio desde Montecon', 'La Administraci�n Nacional de Puertos (ANP) defini� el primer servicio portuario que a partir del pr�ximo 1� de noviembre se traspasar� de Montecon a la Terminal Cuenca del Plata (TCP, propiedad en un 80% de la empresa belga Katoen Natie y 20% de la ANP), en el marco del acuerdo alcanzado entre el gobierno y la multinacional para la extensi�n por 50 a�os de la concesi�n de TCP, la �nica especializada de contenedores en el puerto de Montevideo.', 9)
go

insert Nacionales values (IDENT_CURRENT('Noticias'), 'ART')
go

insert Noticias values ('30/05/2015 04:00',	'Se mud� desde Rusia a Uruguay', 'Un d�a despert� queriendo aprender espa�ol', 'Anna Timofeeva (37 a�os) recuerda bastante bien ese d�a de 2014 en su Rusia natal. Se despert� y sin ninguna raz�n aparente decidi� que quer�a aprender el idioma espa�ol. No lo necesitaba por trabajo ni ten�a amigos que lo hablaran, seg�n ella fue algo vinculado con el destino o con Dios porque gracias a eso termin� en Uruguay. Pero no nos apresuremos. Antes hizo todo lo que estaba a su alcance para aprender el idioma: tomar clases, ver pel�culas, traducir canciones de Natalia Oreiro, quien ya era muy popular en su pa�s. Pero no le alcanzaba, tambi�n quer�a practicar hablando con otras personas.', 9)
go

insert Nacionales values (IDENT_CURRENT('Noticias'), 'ART')
go

insert Noticias values ('30/05/2015 05:00',	'Mirtha Legrand', 'Podr�a recibir el alta hospitalaria en los pr�ximos d�as', 'Mirtha Legrand pas� otra buena noche en el sanatorio Mater Dei de Buenos Aires, donde se encuentra internada en unidad coronaria tras haber sido operada para colocarle dos stents. Seg�n informa La Naci�n, la conductora est� muy bien de �nimo y podr�an darle el alta entre lunes y martes.', 9)
go

insert Internacionales values (IDENT_CURRENT('Noticias'), 'Argentina')
go


-- PROCEDIMIENTOS

-- ABM PERIODISTAS

-- BUSCAR PERIODISTA

create proc BuscarPeriodista
@CodPeri int
as
begin
	select * from Periodistas where CodPeri = @CodPeri
end
go

--declare @res int
--exec BuscarPeriodista 3
--print @res

-- ALTA PERIODISTA

create proc AgregarPeriodista
@CodPeri int,
@Nom varchar(30),
@Ape varchar(30),
@Correo varchar(30)
as
begin
	declare @idPeri int
	
	if exists (select * from Periodistas where CodPeri = @CodPeri)
		return -1
		
	insert Periodistas (CodPeri, Nombre, Apellido, Correo)
		values (@CodPeri, @Nom, @Ape, @Correo)
	if @@ERROR<>0
		return -2
		
	set @idPeri = @CodPeri
	return @idPeri
end
go

--declare @res int
--exec @res = AgregarPeriodista 21, 'Shizue', 'Akamoto', 'manga@japan.com'

--if (@res = -1)
--	print 'Ya existe el periodista'
--else if (@res = -2)
--	print 'Error inesperado, no se pudo agregar la Noticia'
--else
--	print 'Se agrego correctamente Periodista con ID: ' + Convert(varchar,@res)



-- BAJA PERIODISTA

create proc EliminarPeriodista
@CodPeri int
as
begin
	if not exists (select * from Periodistas where CodPeri = @CodPeri)
		return -1
	if exists (select * from Noticias where CodPeri = @CodPeri)
		return -2
		
	delete Periodistas where CodPeri = @CodPeri
	if @@ERROR<>0
		return -3
		
	return 1
end
go

--declare @res int
--exec EliminarPeriodista 22

--if (@res = -1)
--	print 'No existe el periodista'
--else if(@res = -2)
-- print 'El periodista tiene noticias asociadas - No se puede eliminar' 
--else if (@res = -3)
--	print 'Error inesperado, no se pudo agregar la Noticia'
--else
--	print 'Se elimino correctamente Periodista'

-- MODIFICAR PERIODISTA

create proc ModificarPeriodista
@CodPeri int,
@Nom varchar(30),
@Ape varchar(30),
@Correo varchar(30)
as
begin
	if not exists (select * from Periodistas where CodPeri = @CodPeri)
		return -1
		
	update Periodistas 
		set Nombre = @Nom, Apellido = @Ape, Correo = @Correo
		where CodPeri = @CodPeri
	if @@ERROR<>0
		return -2
		
	return 1
end
go

--declare @res int
--exec ModificarPeriodista 10, 'Peble', 'Warrior', 'elroto@gmail.com'

--if (@res = -1)
--	print 'No existe el periodista'
--else if (@res = -2)
--	print 'Error inesperado, no se pudo agregar la Noticia'
--else
--	print 'Se modifico correctamente Periodista'


-- ABM SECCIONES

-- BUSCAR SECCION

create proc BuscarSeccion
@idSec varchar(3)
as
begin
	select * from Secciones where CodSec = @idSec
end
go

-- ALTA SECCIONES

create proc AgregarSeccion
@idSec varchar(3),
@nom varchar(30)
as
begin
	if exists (select * from Secciones where CodSec = @idSec)
		return -1
		
	insert Secciones (CodSec, Nombre) values (@idSec,@nom)
	if @@ERROR <> 0
		return -2
	return 1
end
go

--declare @res int
--exec @res = AgregarSecciones 'INV', 'Investigacion'

--if (@res = -1)
--	print 'Ya existe secci�n con ese c�digo'
--else if (@res = -2)
--	print 'Ocurrio un error inesperado, no se pudo modificar la secci�n'
--else
--	print 'Se agreg� secci�n correctamente'


-- BAJA SECCIONES

create proc EliminarSeccion
@idSec varchar(3)
as
begin
	if not exists (select * from Secciones where CodSec = @idSec)
		return -1
		
	begin tran
		delete Nacionales where CodSec = @idSec
		if @@ERROR <> 0
			begin
				rollback tran
				return -2
			end
		delete Noticias where CodNoti not in (select CodNoti from Nacionales) 
			and CodNoti not in (select CodNoti from Internacionales)
		if @@ERROR <> 0
			begin
				rollback tran
				return -2
			end
		delete Secciones where CodSec = @idSec
		if @@ERROR <> 0
			begin
				rollback tran
				return -2
			end
	commit tran
	return 1
end
go

--declare @res int
--exec EliminarSecciones 'SOC'

--if (@res = -1)
--	print 'No existe secci�n con ese c�digo'
--else if (@res = -2)
--	print 'Ocurrio un error inesperado, no se pudo modificar la secci�n'
--else
--	print 'Se elimin� secci�n correctamente'


-- MODIFICAR SECCIONES

create proc ModificarSeccion
@idSec varchar(3),
@nom varchar (30)
as
begin
	if not exists (select * from Secciones where CodSec = @idSec)
		return -1
			
	update Secciones
	set Nombre = @nom
	where CodSec = @idSec
	if @@ERROR <> 0
		return -2
	return 1
end
go

--declare @res int
--exec @res = ModificarSecciones 'PLA', 'PLASTICO'

--if (@res = -1)
--	print 'No existe secci�n con ese c�digo'
--else if (@res = -2)
--	print 'Ocurrio un error inesperado, no se pudo modificar la secci�n'
--else
--	print 'Se modific� el nombre de la secci�n correctamente'

-- BUSCAR 

-- AGREGAR NOTICIA NACIONAL

create proc AgregarNoticiaNacional
@fecha datetime,
@Titulo varchar(30),
@Resumen varchar(100),
@Contenido nvarchar(max),
@CodPeri int,
@CodSec varchar(3)
as
begin
	declare @idNoti int
	
	if not exists (select * from Periodistas where CodPeri = @CodPeri)
		return -1
		
	if not exists (select * from Secciones where CodSec = @CodSec)
		return -2

	begin tran
		insert Noticias (FechaHora,Titulo,Resumen,Contenido,CodPeri)
				 values (@fecha,@Titulo,@Resumen,@Contenido,@CodPeri)		
		if @@ERROR <> 0
		begin
			rollback tran
			return -3
		end
			
		set @idNoti = IDENT_CURRENT('Noticias')
			
		insert Nacionales (CodNoti,CodSec) values (@idNoti,@CodSec)
		if @@ERROR <> 0
		begin
			rollback tran
			return -3
		end
	commit tran
	return @idNoti
end
go

--declare @res int
--exec @res = AgregarNoticiaNacional '29/09/2021 22:07', 'TituloPrueba','ResumenPrueba','ContenidoPrueba', 2, 'POL'

--if (@res = -1)
--	print 'No existe el periodista'
--else if (@res = -2)
--	print 'No existe la secci�n'
--else if (@res = -3)
--	print 'Error inesperado, no se pudo agregar la Noticia'
--else
--	print 'Se agrego correctamente Noticia con ID: ' + Convert(varchar,@res)

-- AGREGAR NOTICIA INTERNACIONAL

create proc AgregarNoticiaInternacional
@fecha datetime,
@Titulo varchar(30),
@Resumen varchar(100),
@Contenido nvarchar(max),
@CodPeri int,
@Pais varchar(30)
as
begin
	declare @idNoti int
	
	if not exists (select * from Periodistas where CodPeri = @CodPeri)
		return -1
		
	begin tran
		insert Noticias (FechaHora,Titulo,Resumen,Contenido,CodPeri)
				 values (@fecha,@Titulo,@Resumen,@Contenido,@CodPeri)		
		if @@ERROR <> 0
		begin
			rollback tran
			return -2
		end
			
		set @idNoti = IDENT_CURRENT('Noticias')
			
		insert Internacionales (CodNoti,Pais) values (@idNoti,@Pais)
		if @@ERROR <> 0
		begin
			rollback tran
			return -2
		end
	commit tran
	return @idNoti
end
go

--declare @res int
--exec @res = AgregarNoticiaInternacional '29/11/2021 22:07', 'TituloPrueba','ResumenPrueba','ContenidoPrueba', 20, 'Polonia'

--if (@res = -1)
--	print 'No existe el periodista'
--else if (@res = -2)
--	print 'Error inesperado, no se pudo agregar la Noticia'
--else
--	print 'Se agrego correctamente Noticia con ID: ' + Convert(varchar,@res)


create proc ListarSecciones
as
begin
	select * from Secciones
end
go

create proc NacionalesPorSeccion
@idSec varchar(3)
as
begin
	select Noti.CodNoti as [Codigo de Noticia], Noti.CodPeri as [Codigo de Periodista],
		CONVERT(date,Noti.FechaHora) as Fecha, Noti.Titulo, Noti.Resumen, Noti.Contenido
	from Noticias Noti inner join Nacionales Na
	on Noti.CodNoti = Na.CodNoti	
	where CodSec = @idSec	
end
go

--exec NacionalesPorSeccion 'SOC'

create proc ListarNacionales
as
begin
	select Noti.CodNoti, Noti.CodPeri, Na.CodSec,
		Noti.FechaHora, Noti.Titulo, Noti.Resumen, Noti.Contenido 
	from Nacionales Na inner join Noticias Noti
	on Noti.CodNoti = Na.CodNoti
end
go

--exec ListarNacionales

create proc ListarInternacionales
as
begin
	select Noti.CodNoti , Noti.CodPeri,
		Noti.FechaHora , Noti.Titulo, Noti.Resumen, Noti.Contenido, Ni.Pais
	from Internacionales Ni inner join Noticias Noti
	on Noti.CodNoti = Ni.CodNoti
end
go

--exec ListarInternacionales
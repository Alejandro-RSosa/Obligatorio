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

insert Noticias	values	('24/09/2021 16:10', 'Volcán de La Palma', 'El comité de crisis asegura que es un fenómeno normal',	'El cono principal del volcán de La Palma ha sufrido durante la mañana de este sábado una rotura parcial, según ha anunciado Carlos Lorenzo, geólogo del Instituto Geológico y Minero de España (IGME). El geólogo ha asegurado, tras observar el estado mediante drones, que este fenómeno ha dejado “una colada enorme de bloques muy grandes desplazados por la ladera del cono en dirección al mar”. El director técnico del comité de crisis, Miguel Ángel Morcuende, ha restado importancia al fenómeno. “El cono no soporta su propio peso y también debido a las deflagraciones de ayer busca poder sostenerse, pero no ha tenido mayor importancia”, ha dicho. Todo el material derruido de esta boca principal se estaría deslizando por la colada primigenia, ha explicado Morcuende, “evacuando los trozos que ha roto de la propia estructura y le cuesta mucho avanzar”. MÁS INFORMACIÓN Además, el director técnico ha señalado la existencia de un nuevo centro emisor en la misma fisura, por encima de Montaña Rajada, que había comenzado a emitir materiales al oeste del cono principal. Los científicos que siguen la erupción creen que podría tratarse de una de las primeras bocas que se abrieron en las primeras horas de la crisis que ha vuelto a emitir después de un periodo apagado. “No genera inquietud”, ha tranquilizado Morcuende.', 1)
go

insert Internacionales values (IDENT_CURRENT('Noticias'), 'España')
go

insert Noticias values ('25/09/2021 04:00', 'Mides informe crítico', 'El trabajo del grupo Red Calle, de junio de 2018', 'En una charla con organizaciones sociales, una directora del Ministerio de Desarrollo Social (Mides) se enteró de la existencia de un informe de “diagnóstico, recomendaciones y sugerencias” realizado por Red Calle, un grupo que analiza políticas de atención a las personas en situación de calle y que es integrado por Uruguay, Costa Rica, Chile, Brasil, Colombia y Paraguay. Cuando lo revisaron, vieron que este era profundamente crítico con algunos de los aspectos de la gestión del Frente Amplio liderada por Marina Arismendi.	El trabajo, que es de junio de 2018, expone varios cambios que se entendía que deberían ser implementados en el Mides. El actual jerarca de la cartera, Martín Lema, dijo el jueves en Comisión de Presupuesto Integrada con Hacienda de la Cámara de Senadores que ese material hubiera sido útil para generar políticas para esa población y sostuvo que algunas de las recomendaciones -aunque sin conocerlas por el documento- se estaban implementando ahora.', 2)
go

insert Nacionales values (IDENT_CURRENT('Noticias'), 'SOC')
go

insert Noticias values ('23/09/2021 13:25:30', 'Pinocho Sosa',	'Intuición, pasión y emoción',	'El parodista. El productor. El director. El cantante de cumbia. La figura indiscutible. El polemista. El tribunero. El que hacía sentir parte a todos los que llegaban a un ensayo de Zíngaros. El que impulsaba carreras. El empresario. El loco. El odiado, el más odiado. El amado, el más amado de todos. El único. Ayer murió Ariel Sosa, Pinocho, tras varios días de internación por la agudización del cáncer que le habían diagnosticado en 2019. Tenía 58 años (cumplía 59 el 1 de octubre) y de esos, pasó 40 inmerso en el mundo del carnaval. “Dejo mi vida en esto”, dijo en febrero en su última entrevista con Sábado Show. En los hechos, lo demostró en cada escenario que pisó, en cada tablado que llenó de una energía desbordante y emotiva.', 3)
go

insert Nacionales values (IDENT_CURRENT('Noticias'), 'SOC')
go

insert Noticias values ('20/09/2021 15:00', 'La Casa Blanca', 'Dice que se trata de un trámite, pero quedan pocos días para que el Congreso evite una catástrofe.',	'La Casa Blanca informó a las agencias gubernamentales que deben prepararse para un posible cierre del Gobierno federal si no se firma un proyecto de ley presupuestario de emergencia antes del 30 de septiembre. “Estamos tomando todas las medidas posibles para mitigar el impacto de un posible cierre”, dijo la secretaria de prensa de la Casa Blanca, Jen Psaki, durante una sesión informativa el jueves.	Todavía no hay una decisión formal, pero es “sólo un recordatorio de que estamos a siete días y tenemos que estar preparados, por supuesto, en cualquier caso de cualquier contingencia, por lo que vemos esto como un paso de rutina que es sólo para estar preparados”, dijo Psaki.',3)
go

insert Internacionales values (IDENT_CURRENT('Noticias'), 'EEUU')
go

insert Noticias values ('13/08/2018 09:05', 'Se va construir un sistema', 'Se realizó un taller interinstitucional, para trabajar en el Sistema Nacional Rural ', 'El taller que inicia este proyecto se realizó en la sala de conferencias de la Rural del Prado, este jueves 23, encabezado por el ministro de Ganadería Agricultura y Pesca, Fernando Mattos, junto con el subsecretario de la cartera, Juan Ignacio Buffa; el presidente del Instituto Nacional de la Leche, Juan Daniel Vago; el titular del Instituto Nacional de Investigación Agropecuaria, José Bonica; el presidente del Instituto Plan Agropecuario, Esteban Carriquiry, y el presidente del Instituto Nacional de Colonización, Julio César Cardozo. En su oratoria, al finalizar la jornada de trabajo, el ministro Mattos subrayó que hay sectores que requieren de las políticas públicas para que no se amplíe la brecha entre productores exitosos y “los que quedan en el camino”, en referencia a quienes deben abandonar el medio rural. Señaló que Uruguay atravesó por un proceso que, por un lado, incrementó la producción de bienes y, por otro, concentró la propiedad de la tierra y expulsó a residentes del campo hacia las ciudades.',7)
go

insert Nacionales values (IDENT_CURRENT('Noticias'), 'SOC')
go

insert Noticias values ('30/05/2015 05:00', 'El exitoso mercado de un niño', 'En la Venezuela de la escasez, el adolescente Andrés López desafía la precariedad con ingenio.', 'Tiene solo 14 años, pero maña de sobra. Con sus manos ensambla chanclas, "cholas", como se les llama en Venezuela, valiéndose de materiales desechados.  Para la suela utiliza caucho de neumáticos. Primero descuartiza, luego moldea. Cose con agujas extraídas de tacones de mujer. Es un trabajo minucioso. "Había gente aquí, en Ciudad Bolívar, que ya las hacía. Pero les quedaban torcidas. A mí me quedan derechas", dice, con satisfacción, a BBC Mundo. Ciudad Bolívar es la capital del estado de Bolívar, localizado al sureste de Venezuela. Como casi todo el país, la ciudad sufre los estragos de la hiperinflación, la falta de acceso a dólares, moneda que de facto permite sobrevivir, y el elevado precio de productos básicos.',5)
go

insert Internacionales values (IDENT_CURRENT('Noticias'), 'Venezuela')
go

insert Noticias values ('30/05/2015 05:00',	'La LUC no es para el FA',	'El coordinador del FA dijo que el referéndum contra la LUC', '“No está en discusión en el Congreso. El tema de la LUC  (Ley de Urgente Consideración) no es para el Frente una evaluación del gobierno a mitad de camino. Es un tema mayor para el país y así se encara” dijo esta mañana Ricardo Ehrlich, coordinador del FA,  luego de una recorrida por las comisiones que trabajan de cara al Congreso del Frente Amplio de este fin de semana. Ehrlich fue consultado por las críticas de la oposición a las dos interpelaciones realizadas esta semana a los ministros Heber y García. Desde el oficialismo se acusó de usar las interpelaciones para fortalecer la campaña de referéndum para derogar 135 artículos de la LUC. ',8)
go

insert Nacionales values (IDENT_CURRENT('Noticias'), 'PLA')
go

insert Noticias values ('30/05/2015 05:00',	'Nuevas reglas en el puerto', 'La ANP determinó el traspaso del primer servicio desde Montecon', 'La Administración Nacional de Puertos (ANP) definió el primer servicio portuario que a partir del próximo 1º de noviembre se traspasará de Montecon a la Terminal Cuenca del Plata (TCP, propiedad en un 80% de la empresa belga Katoen Natie y 20% de la ANP), en el marco del acuerdo alcanzado entre el gobierno y la multinacional para la extensión por 50 años de la concesión de TCP, la única especializada de contenedores en el puerto de Montevideo.', 9)
go

insert Nacionales values (IDENT_CURRENT('Noticias'), 'ART')
go

insert Noticias values ('30/05/2015 04:00',	'Se mudó desde Rusia a Uruguay', 'Un día despertó queriendo aprender español', 'Anna Timofeeva (37 años) recuerda bastante bien ese día de 2014 en su Rusia natal. Se despertó y sin ninguna razón aparente decidió que quería aprender el idioma español. No lo necesitaba por trabajo ni tenía amigos que lo hablaran, según ella fue algo vinculado con el destino o con Dios porque gracias a eso terminó en Uruguay. Pero no nos apresuremos. Antes hizo todo lo que estaba a su alcance para aprender el idioma: tomar clases, ver películas, traducir canciones de Natalia Oreiro, quien ya era muy popular en su país. Pero no le alcanzaba, también quería practicar hablando con otras personas.', 9)
go

insert Nacionales values (IDENT_CURRENT('Noticias'), 'ART')
go

insert Noticias values ('30/05/2015 05:00',	'Mirtha Legrand', 'Podría recibir el alta hospitalaria en los próximos días', 'Mirtha Legrand pasó otra buena noche en el sanatorio Mater Dei de Buenos Aires, donde se encuentra internada en unidad coronaria tras haber sido operada para colocarle dos stents. Según informa La Nación, la conductora está muy bien de ánimo y podrían darle el alta entre lunes y martes.', 9)
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
--	print 'Ya existe sección con ese código'
--else if (@res = -2)
--	print 'Ocurrio un error inesperado, no se pudo modificar la sección'
--else
--	print 'Se agregó sección correctamente'


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
--	print 'No existe sección con ese código'
--else if (@res = -2)
--	print 'Ocurrio un error inesperado, no se pudo modificar la sección'
--else
--	print 'Se eliminó sección correctamente'


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
--	print 'No existe sección con ese código'
--else if (@res = -2)
--	print 'Ocurrio un error inesperado, no se pudo modificar la sección'
--else
--	print 'Se modificó el nombre de la sección correctamente'

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
--	print 'No existe la sección'
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
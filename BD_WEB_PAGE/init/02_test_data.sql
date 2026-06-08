-- =========================================================
-- 02_TEST_DATA.SQL
-- Datos de prueba para el LMS IMETESH
-- =========================================================

-- =========================================================
-- 1. CARRERAS
-- =========================================================
INSERT INTO carreras (id, nombre, slug, descripcion)
VALUES 
  ('a1000000-0000-0000-0000-000000000001', 'Ingeniería Informática', 'ingenieria-informatica', 'Carrera enfocada en desarrollo de software y sistemas computacionales.'),
  ('a1000000-0000-0000-0000-000000000002', 'Ingeniería en Sistemas Computacionales', 'ingenieria-sistemas', 'Carrera orientada a infraestructura tecnológica y redes.');

-- =========================================================
-- 2. USUARIOS
-- =========================================================
INSERT INTO usuarios (id, carrera_id, nombre, correo, hash_contrasena, rol, estado, acepto_terminos, fecha_aceptacion)
VALUES
  -- Administrador
  ('b1000000-0000-0000-0000-000000000001', NULL, 'Admin Principal', 'admin@imetesh.com', 'hash_admin_123', 'administrador', 'activo', TRUE, NOW()),
  -- Docente
  ('b1000000-0000-0000-0000-000000000002', 'a1000000-0000-0000-0000-000000000001', 'Juan Pérez', 'docente1@imetesh.com', 'hash_docente_456', 'docente', 'activo', TRUE, NOW()),
  -- Estudiante
  ('b1000000-0000-0000-0000-000000000003', 'a1000000-0000-0000-0000-000000000001', 'María López', 'estudiante1@imetesh.com', 'hash_estudiante_789', 'estudiante', 'activo', TRUE, NOW());

-- =========================================================
-- 3. MATERIAS
-- =========================================================
INSERT INTO materias (id, carrera_id, nombre, slug, descripcion)
VALUES
  ('c1000000-0000-0000-0000-000000000001', 'a1000000-0000-0000-0000-000000000001', 'Matemáticas Discretas', 'matematicas-discretas', 'Fundamentos de lógica, conjuntos, grafos y álgebra booleana.'),
  ('c1000000-0000-0000-0000-000000000002', 'a1000000-0000-0000-0000-000000000002', 'Lenguajes y Autómatas', 'lenguajes-automatas', 'Estudio de lenguajes formales, autómatas finitos y gramáticas.');

-- =========================================================
-- 4. GRUPOS (asignando docente real)
-- =========================================================
INSERT INTO grupos (id, carrera_id, materia_id, docente_id, nombre, descripcion, periodo_academico, nip_acceso)
VALUES
  ('d1000000-0000-0000-0000-000000000001', 
   (SELECT carrera_id FROM materias WHERE id = 'c1000000-0000-0000-0000-000000000001'),
   'c1000000-0000-0000-0000-000000000001',
   (SELECT id FROM usuarios WHERE correo = 'docente1@imetesh.com'),
   'Grupo 101 - MD', 
   'Grupo matutino de Matemáticas Discretas', 
   '2026-A', 
   'MD101-2026A'),
   
  ('d1000000-0000-0000-0000-000000000002', 
   (SELECT carrera_id FROM materias WHERE id = 'c1000000-0000-0000-0000-000000000002'),
   'c1000000-0000-0000-0000-000000000002',
   (SELECT id FROM usuarios WHERE correo = 'docente1@imetesh.com'),
   'Grupo 201 - LA', 
   'Grupo vespertino de Lenguajes y Autómatas', 
   '2026-A', 
   'LA201-2026A');

-- =========================================================
-- 5. INSCRIPCIONES
-- =========================================================
INSERT INTO inscripciones (id, grupo_id, usuario_id, rol_en_grupo)
VALUES
  ('e1000000-0000-0000-0000-000000000001', 
   'd1000000-0000-0000-0000-000000000001', 
   (SELECT id FROM usuarios WHERE correo = 'estudiante1@imetesh.com'), 
   'estudiante'),
   
  ('e1000000-0000-0000-0000-000000000002', 
   'd1000000-0000-0000-0000-000000000002', 
   (SELECT id FROM usuarios WHERE correo = 'estudiante1@imetesh.com'), 
   'estudiante');

-- =========================================================
-- 6. UNIDADES (para cada materia)
-- =========================================================
-- Unidades de Matemáticas Discretas
INSERT INTO unidades (id, materia_id, numero_unidad, titulo, descripcion, competencias, orden, publicado)
VALUES
  ('f1000000-0000-0000-0000-000000000001', 'c1000000-0000-0000-0000-000000000001', 1, 'Lógica Proposicional', 'Introducción a la lógica, conectivas y tablas de verdad.', 'Comprender y aplicar operadores lógicos.', 1, TRUE),
  ('f1000000-0000-0000-0000-000000000002', 'c1000000-0000-0000-0000-000000000001', 2, 'Teoría de Conjuntos', 'Operaciones, relaciones y propiedades de conjuntos.', 'Manejar representaciones y operaciones de conjuntos.', 2, TRUE);

-- Unidades de Lenguajes y Autómatas
INSERT INTO unidades (id, materia_id, numero_unidad, titulo, descripcion, competencias, orden, publicado)
VALUES
  ('f1000000-0000-0000-0000-000000000003', 'c1000000-0000-0000-0000-000000000002', 1, 'Lenguajes Formales', 'Definición, tipos de lenguajes y operaciones.', 'Distinguir lenguajes regulares de libres de contexto.', 1, TRUE),
  ('f1000000-0000-0000-0000-000000000004', 'c1000000-0000-0000-0000-000000000002', 2, 'Autómatas Finitos', 'AFD, AFND y equivalencias.', 'Construir y minimizar autómatas finitos.', 2, FALSE);

-- =========================================================
-- 7. TEMAS (dentro de cada unidad)
-- =========================================================
-- Temas de Lógica Proposicional (unidad f1)
INSERT INTO temas (id, unidad_id, tema_padre_id, titulo, descripcion, orden, publicado)
VALUES
  ('g1000000-0000-0000-0000-000000000001', 'f1000000-0000-0000-0000-000000000001', NULL, 'Proposiciones y Conectivas', 'Definición de proposición, conjunción, disyunción, negación.', 1, TRUE),
  ('g1000000-0000-0000-0000-000000000002', 'f1000000-0000-0000-0000-000000000001', NULL, 'Tablas de Verdad', 'Construcción de tablas de verdad para fórmulas compuestas.', 2, TRUE),
  ('g1000000-0000-0000-0000-000000000003', 'f1000000-0000-0000-0000-000000000001', 'g1000000-0000-0000-0000-000000000001', 'Equivalencias Lógicas', 'Uso de leyes de equivalencia para simplificar.', 3, TRUE);

-- Temas de Teoría de Conjuntos (unidad f2)
INSERT INTO temas (id, unidad_id, tema_padre_id, titulo, descripcion, orden, publicado)
VALUES
  ('g1000000-0000-0000-0000-000000000004', 'f1000000-0000-0000-0000-000000000002', NULL, 'Definición y Notación', 'Pertenencia, determinación por extensión y comprensión.', 1, TRUE),
  ('g1000000-0000-0000-0000-000000000005', 'f1000000-0000-0000-0000-000000000002', NULL, 'Operaciones con Conjuntos', 'Unión, intersección, diferencia y complemento.', 2, TRUE);

-- Temas de Lenguajes Formales (unidad f3)
INSERT INTO temas (id, unidad_id, tema_padre_id, titulo, descripcion, orden, publicado)
VALUES
  ('g1000000-0000-0000-0000-000000000006', 'f1000000-0000-0000-0000-000000000003', NULL, 'Alfabeto y Cadenas', 'Símbolos, cadenas, concatenación y longitud.', 1, TRUE),
  ('g1000000-0000-0000-0000-000000000007', 'f1000000-0000-0000-0000-000000000003', NULL, 'Operaciones con Lenguajes', 'Unión, concatenación y cerradura de Kleene.', 2, TRUE);

-- =========================================================
-- 8. RECURSOS (diferentes contextos y visibilidades)
-- =========================================================
-- Recurso asociado a un tema (visibilidad grupo = requiere grupo_id)
INSERT INTO recursos (id, tema_id, unidad_id, grupo_id, subido_por, titulo, descripcion, tipo_recurso, visibilidad, nombre_original, nombre_guardado, ruta_almacenamiento, tipo_mime, tamaño_archivo, url_externa, orden, publicado)
VALUES
  ('h1000000-0000-0000-0000-000000000001', 
   'g1000000-0000-0000-0000-000000000001', 
   NULL, 
   'd1000000-0000-0000-0000-000000000001',   -- grupo 101 MD
   (SELECT id FROM usuarios WHERE correo = 'docente1@imetesh.com'),
   'PDF Lógica Proposicional',
   'Documento con los fundamentos de la lógica.',
   'pdf',
   'grupo',
   'logica_intro.pdf',
   'recursos/logica_intro_v1.pdf',
   '/almacen/recursos/logica_intro.pdf',
   'application/pdf',
   204800,
   NULL,
   1,
   TRUE);

-- Recurso asociado directamente a una unidad (visibilidad publico, sin grupo)
INSERT INTO recursos (id, tema_id, unidad_id, grupo_id, subido_por, titulo, descripcion, tipo_recurso, visibilidad, nombre_original, nombre_guardado, ruta_almacenamiento, tipo_mime, tamaño_archivo, url_externa, orden, publicado)
VALUES
  ('h1000000-0000-0000-0000-000000000002', 
   NULL, 
   'f1000000-0000-0000-0000-000000000002',   -- unidad Teoría de Conjuntos
   NULL,
   (SELECT id FROM usuarios WHERE correo = 'docente1@imetesh.com'),
   'Video Operaciones de Conjuntos',
   'Explicación animada de unión e intersección.',
   'video',
   'publico',
   'conjuntos_ops.mp4',
   'recursos/conjuntos_ops_v1.mp4',
   '/almacen/recursos/conjuntos_ops.mp4',
   'video/mp4',
   5242880,
   NULL,
   2,
   TRUE);

-- Recurso asociado a un grupo (visibilidad grupo, sin tema ni unidad)
INSERT INTO recursos (id, tema_id, unidad_id, grupo_id, subido_por, titulo, descripcion, tipo_recurso, visibilidad, nombre_original, nombre_guardado, ruta_almacenamiento, tipo_mime, tamaño_archivo, url_externa, orden, publicado)
VALUES
  ('h1000000-0000-0000-0000-000000000003', 
   NULL, 
   NULL, 
   'd1000000-0000-0000-0000-000000000002',   -- grupo 201 LA
   (SELECT id FROM usuarios WHERE correo = 'docente1@imetesh.com'),
   'Enlace Repositorio Gramáticas',
   'Sitio externo con ejemplos de gramáticas formales.',
   'enlace',
   'grupo',
   NULL,
   NULL,
   NULL,
   NULL,
   NULL,
   'https://ejemplosgramaticas.edu',
   3,
   TRUE);

-- =========================================================
-- 9. TAREAS
-- =========================================================
INSERT INTO tareas (id, grupo_id, creado_por, titulo, descripcion, fecha_entrega, publicada)
VALUES
  ('i1000000-0000-0000-0000-000000000001', 
   'd1000000-0000-0000-0000-000000000001', 
   (SELECT id FROM usuarios WHERE correo = 'docente1@imetesh.com'),
   'Tablas de Verdad - Ejercicio 1',
   'Construir la tabla de verdad para (p ∧ q) ∨ ¬r.',
   '2026-06-20 23:59:00',
   TRUE),
   
  ('i1000000-0000-0000-0000-000000000002', 
   'd1000000-0000-0000-0000-000000000001', 
   (SELECT id FROM usuarios WHERE correo = 'docente1@imetesh.com'),
   'Conjuntos - Intersección y Unión',
   'Dados A={1,2,3,4}, B={3,4,5,6}, calcular A∩B y A∪B.',
   '2026-06-25 23:59:00',
   FALSE);

-- =========================================================
-- 10. ENTREGAS
-- =========================================================
INSERT INTO entregas (id, tarea_id, usuario_id, ruta_archivo, estado, entregado_en, calificacion, retroalimentacion)
VALUES
  ('j1000000-0000-0000-0000-000000000001',
   'i1000000-0000-0000-0000-000000000001',
   (SELECT id FROM usuarios WHERE correo = 'estudiante1@imetesh.com'),
   '/entregas/estudiante1/tabla_verdad.pdf',
   'revisado',
   '2026-06-19 18:30:00',
   9.5,
   'Excelente trabajo, solo un pequeño error en la última fila.'),
   
  ('j1000000-0000-0000-0000-000000000002',
   'i1000000-0000-0000-0000-000000000002',
   (SELECT id FROM usuarios WHERE correo = 'estudiante1@imetesh.com'),
   '/entregas/estudiante1/conjuntos.txt',
   'entregado',
   '2026-06-24 22:15:00',
   NULL,
   NULL);

-- =========================================================
-- DATOS ADICIONALES OPCIONALES
-- =========================================================
-- Puedes agregar más registros aquí según necesites probar funcionalidades específicas.
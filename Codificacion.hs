----------------------------------------------------------------------------------------------------
-- Biblioteca con las funciones necesarias para realizar la codificación de mensajes              --
----------------------------------------------------------------------------------------------------
module Codificacion where

-- Función divide tal que (divide p xs) es el par (ys,zs) donde ys es el mayor prefijo de xs cuyos
-- elementos cumplen p y zs es la lista de los elementos restantes de xs.
divide :: (a -> Bool) -> [a] -> ([a],[a])
-- Aquí va tu código.
divide p xs = (takeWhile p xs, dropWhile p xs)
-- Función palabras tal que (palabras cs) es la lista de palabras contenidas en la cadena cs.
palabras :: String -> [String]
-- Aquí va tu código.
palabras [] = []
palabras cs = cs1 : palabras cs2
   where cs' = dropWhile (==' ') cs
         (cs1,cs2) = divide (/=' ') cs'
-- Función longitudes tal que (longitudes xss) es la lista de las longitudes de los elementos xss.
longitudes :: [[a]] -> [Int]
-- Aquí va tu código.
longitudes = map length
-- Función une tal que (une xss) es la lista obtenida uniendo los elementos de xss.
une :: [[a]] -> [a]
-- Aquí va tu código.
une = concat
-- Función reagrupa tal que (reagrupa xs) es la lista obtenida agrupando los elementos de xs de 4 en
-- 4.
reagrupa :: [a] -> [[a]]
-- Aquí va tu código.
reagrupa [] = []
reagrupa xs = take 4 xs : reagrupa (drop 4 xs)
-- Función inversas tal que (inversas xss) es la lista obtenida invirtiendo los elementos de xss.
inversas :: [[a]] -> [[a]]

-- Aquí va tu código.
inversas = map reverse

-- Función agrupa tal que (agrupa xs ns) es la lista obtenida agrupando los elementos de xs según
-- las longitudes indicadas en ns.
agrupa :: [a] -> [Int] -> [[a]]
-- Aquí va tu código.
agrupa [] _ = []
agrupa xs (n:ns) = (take n xs) : (agrupa (drop n xs) ns)
-- Función frase tal que (frase xs) es la frase obtenida de las palabras de xs dejando un espacio en
-- blanco entre ellas.
frase :: [String] -> String
-- Aquí va tu código.
frase [x] = x
frase (x:xs) = x ++ " " ++ frase xs
frase [] = []
-- Función vlave que realiza el proceso de codificación completo.
clave :: String -> String
-- Aquí va tu código.
clave xss = frase (agrupa (une (inversas (reagrupa (une ps))))
                         (reverse (longitudes ps)))
  where ps = palabras xss
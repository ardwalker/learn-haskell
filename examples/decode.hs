
{-
Example usage:
echo "ACAUGUCAGUACGUAGCUAC" | runghc decode.hs 
-}

data RNA = A | U | C | G deriving (Read)

data AminoAcid
    = Ala | Cys | Asp | Glu | Phe | Gly | His | Ile | Lys | Leu
    | Met | Asn | Pro | Gln | Arg | Ser | Thr | Val | Trp | Tyr
    | Stop
    deriving (Show)

decode :: RNA -> RNA -> RNA -> AminoAcid 
decode U U U = Phe
decode U U C = Phe
decode U U A = Leu
decode U U G = Leu
decode U C _ = Ser
decode U A U = Tyr
decode U A C = Tyr
decode U A A = Stop
decode U A G = Stop
decode U G U = Cys
decode U G C = Cys
decode U G A = Stop
decode U G G = Trp
decode C U _ = Leu
decode C C _ = Pro
decode C A U = His
decode C A C = His
decode C A A = Gln
decode C A G = Gln
decode C G _ = Arg
decode A U U = Ile
decode A U C = Ile
decode A U A = Ile
decode A U G = Met
decode A C _ = Thr
decode A A U = Asn
decode A A C = Asn
decode A A A = Lys
decode A A G = Lys
decode A G U = Ser
decode A G C = Ser
decode A G A = Arg
decode A G G = Arg
decode G U _ = Val
decode G C _ = Ala
decode G A U = Asp
decode G A C = Asp
decode G A A = Glu
decode G A G = Glu
decode G G _ = Gly

decodeAll :: [RNA] -> [AminoAcid]
decodeAll (a:b:c:ds) = decode a b c : decodeAll ds
decodeAll  _         = []

main = do
    str <- getContents
    let rna :: [RNA]
        rna = map (\c -> read [c]) str

    let aminoAcids :: [AminoAcid]
        aminoAcids = decodeAll rna

    putStrLn (concatMap show aminoAcids)
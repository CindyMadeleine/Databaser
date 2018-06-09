-- Oppgave 2-i

select p.personnr, p.navn, b.adr, b.bolignr
from  (select personnr, salgsrolle
		from salgspart s1 
		natural join salgspart s2
		natural join salgspart s3
		where s1.salgsrolle = 'kjoper' and s2.salgsrolle = 'selger' and s3.salgsrolle = 'megler') p, boligsalg b
where b.salgsnr = p.salgsnr;


-- Oppgave 2-ii
select mnr, count(mnr) as antEndringer
from boligsalg b, boligsalg b2
where b.mnr = b2.mnr and b.boligtype != b2.boligtype
group by mnr
having max(antEndringer);


-- Oppgave 2-iii
create view HarIkkeMegler as (
select mnr
from boligsalg b
where b.salgsnr NOT IN (
select s.salgsnr
from salgspart s
where s.salgsrolle = 'megler'));

select distinct mnr, knr, gnr, bnr, fnr, snr
from matrikkel m, harikkemegler h
where m.mnr = h.mnr;



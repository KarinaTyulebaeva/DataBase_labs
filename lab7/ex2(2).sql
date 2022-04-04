--2.1
SELECT S.schoolName as SN, B.publisher as P, COUNT(*)
FROM LoanBooks as LB
    JOIN Book as B on LB.bookId = B.bookId
    JOIN School S on LB.schoolId = S.schoolId
GROUP BY SN, P;
--2.2
SELECT DISTINCT S.schoolName, B.bookName, LB.loanDate, T.teacherName
FROM LoanBooks as LB
    JOIN School S on LB.schoolId = S.schoolId
    JOIN Book B on B.bookId = LB.bookId
    JOIN Teacher T on LB.teacherId = T.teacherId
WHERE LB.loanDate = (SELECT MIN(LB2.loanDate)
                    FROM Teacher as T2, LoanBooks as LB2
                    WHERE T2.teacherId = LB2.teacherId AND LB2.schoolId = S.schoolId)
    AND T.teacherId = LB.teacherId
package test;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;

import java.util.Arrays;

@Aspect
public class World {

    @Before("execution(@test.LogArgs * *.*(..))")
    public void logCalls(JoinPoint joinPoint) throws Throwable {
        System.out.println("Method " + joinPoint.toString() + " called with arguments: " + Arrays.deepToString(joinPoint.getArgs()));
    }

    @Around("execution(@test.Timed * *.*(..))")
    public Object time(ProceedingJoinPoint joinPoint) throws Throwable {
        long start = System.currentTimeMillis();
        Object output = joinPoint.proceed();
        long elapsedTime = System.currentTimeMillis() - start;
        System.out.println("Method " + joinPoint.toString() + " finished in time: " + elapsedTime + " milliseconds.");
        return output;
    }

}

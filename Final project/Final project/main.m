//
//  main.m
//  Final project
//
//  Created by MacBook Pro on 18/08/23.
//

#import <Foundation/Foundation.h>
#include <math.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        double a, b, c;
        double discriminant, x1, x2;
        
        // Ввод коэффициентов уравнения
        printf("Введите коэффициент a: ");
        scanf("%lf", &a);
        
        printf("Введите коэффициент b: ");
        scanf("%lf", &b);
        
        printf("Введите коэффициент c: ");
        scanf("%lf", &c);
        
        // Расчет дискриминанта
        discriminant = b * b - 4 * a * c;
        
        // Проверка значений дискриминанта и вывод решений
        if (discriminant > 0) {
            x1 = (-b + sqrt(discriminant)) / (2 * a);
            x2 = (-b - sqrt(discriminant)) / (2 * a);
            
            printf("Уравнение имеет два корня:\n");
            printf("x1 = %.2lf\n", x1);
            printf("x2 = %.2lf\n", x2);
        } else if (discriminant == 0) {
            x1 = -b / (2 * a);
            
            printf("Уравнение имеет один корень:\n");
            printf("x1 = %.2lf\n", x1);
        } else {
            printf("Уравнение не имеет действительных корней.\n");
        }
    }
    return 0;
}


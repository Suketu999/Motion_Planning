show(map);
hold on
plot(bicycleTranslations(15:end,1),bicycleTranslations(15:end,2));
hold on
plot(trailer(15:end,1),trailer(15:end,2));
legend('Truck','Trailer');
title('The Truck');
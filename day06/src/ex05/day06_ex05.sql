COMMENT ON TABLE person_discounts
        IS 'Эта таблица хранит в себе информацию о скидках для посетителей:
        id посетителя, id пиццерии, величину скидки в процентах.';

COMMENT ON COLUMN person_discounts.id
        IS 'Уникальные идентификаторы записей таблицы.';

COMMENT ON COLUMN person_discounts.person_id
        IS 'Уникальные идентификаторы посетителей.';

COMMENT ON COLUMN person_discounts.pizzeria_id
        IS 'Уникальные идентификаторы пиццерий.';

COMMENT ON COLUMN person_discounts.pizzeria_id
        IS 'Величина скидки в процентах.';

COMMENT ON CONSTRAINT ch_nn_person_id 
        ON person_discounts 
        IS 'Следит, чтобы значение person_id не было равно NULL.';

COMMENT ON CONSTRAINT ch_nn_pizzeria_id 
        ON person_discounts 
        IS 'Следит, чтобы значение pizzeria_id не было равно NULL.';

COMMENT ON CONSTRAINT ch_nn_discount 
        ON person_discounts 
        IS 'Следит, чтобы значение discount не было равно NULL.';

COMMENT ON CONSTRAINT ch_range_discount 
        ON person_discounts 
        IS 'Следит, чтобы значение discount было от 0 до 100.';        
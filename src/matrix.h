typedef struct {
        unsigned int rows;
        unsigned int cols;
        double **mat_data;
} matrix_struct;

matrix_struct *get_matrix_struct(char matrix[]);
void print_matrix(matrix_struct *matrix_to_print);
//void save_matrix(matrix_struct *matrix_to_save, char *c);
void free_matrix(matrix_struct *matrix_to_free);


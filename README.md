# ELT pipeline using DBT and Docker

This project demonstrates the setup and development of a ELT pipeline using DBT within a containerized environment. Leveraging Docker, I set up PostgreSQL (Adventureworks DB) and DBT containers on the same network, allowing seamless integration between them. The DBT project focuses on building a data workflow, including staging, intermediate and final warehouse layers.

Throughout the project, I utilized DBT's built-in tests as well as custom data quality checks, ensuring reliable and consistent data outputs. Additional features include custom macros for outlier detection and performance optimizations through index creation. I also worked with popular DBT packages like dbt_utils and dbt_expectations to streamline functionality and ensure advanced data testing.

## docker commands

- docker-compose build --no-cache 
- docker-compose up -d

## dbt commands

- dbt run --full-refresh
- dbt test
- dbt build (dbt run & dbt test)
- dbt clean
- dbt deps (install packages)
- dbt debug (to check the configuration and connection setup)

run with dbt_adventureworks_local (localhost):
- dbt run --full-refresh --profile dbt_adventureworks_local
- dbt test --profile dbt_adventureworks_local 

# Learnings

## Container Setup
- [x] **Set up PostgreSQL in a container** and verify you can query the database from your local machine
- [x] **Set up dbt in a container** on the same network
- [x] **Configure `profiles.yml`** to connect dbt to the PostgreSQL database
- [x] **Create a `docker-compose.yml`** file to manage both containers

## dbt Project Initialization
- [x] **Use dbt-core** to initialize a dbt project
- [x] **Tables**: Define tables using `materialized='table'` config
- [x] **Ephemeral Tables**: Use `config(materialized='ephemeral')` for models that shouldn’t be materialized as tables or views. dbt macro operations cannot run in ephemeral models.
- [x] **Views**: Define views using `materialized='view'` config
- [ ] **Incremental**

## Documentation & Configuration
- [x] **Source Configuration**: Define your data sources in `sources` to track dependencies
- [x] **Model Configuration**: Add metadata, descriptions, and tags to your models in `schema.yml`
- [x] **Lineage Diagrams**: Ensure all models have lineage defined for clear data flow visualization

## Testing & Quality Checks
- [x] **Singular Tests**: Custom tests defined in the `tests/` directory
- [x] **Generic Tests**: Use dbt’s built-in tests or custom generic tests in `tests/generic/`
- [ ] **Custom Tests**: Write your own data quality tests to ensure integrity

## Compilation & Execution
- [x] **Verify the target directory**: Check the `target` folder for compiled and executed SQL code to understand what dbt runs

## Package Management
- [x] `dbt_expectations`: For advanced data testing
- [x] `codegen`: To automate code generation
- [x] `dbt_utils`: For common dbt utility functions

## Data Workflow Development
Build a data workflow from source to final tables:
- [x] **Staging layer** to load source data and rename columns
- [x] **Intermediate Layer**: transform data and implement logic to flag data based on certain conditions
- [x] **Analyze Flagged Data**: Create mechanisms to analyze or report on flagged data
- [x] **Warehouse Layer**: Filter flaged data to include only valid data in the final table

## Advanced Features
- [x] **Write custom macro**: Flag outliers based on IQR in `detect_outliers.sql`
- [ ] **Perform Analyses**: Use dbt’s `analyses/` folder to write and run SQL analyses
- [ ] **Create Seeds**: Load CSV files into your warehouse as tables using dbt’s seeding functionality
- [ ] **Implement Snapshots**: Capture historical states of slowly changing dimensions using dbt snapshots

## Additional Optimizations
- [x] **Create an index**: Use model-level configurations in `model.sql` to add indexes for performance optimization


# Further Reading
- [ ] [dbt contract](https://docs.getdbt.com/reference/resource-configs/contract?source=post_page-----28e335be5f7e--------------------------------)
- [ ] [dbt constraint](https://docs.getdbt.com/reference/resource-properties/constraints?source=post_page-----28e335be5f7e--------------------------------)
- [x] [boost-your-dbt-tests-using-great-expectations-in-dbt](https://zoltanctoth.medium.com/boost-your-dbt-tests-using-great-expectations-in-dbt-1c2d33d53fb3)
- [x] [down-with-pipeline-debt-introducing-great-expectations](https://medium.com/@expectgreatdata/down-with-pipeline-debt-introducing-great-expectations-862ddc46782a)
- [x] [dbt-best-practices/how-we-structure](https://docs.getdbt.com/best-practices/how-we-structure/1-guide-overview)
- [ ] [bt-constraints-automatic-primary-keys-unique-keys-and-foreign-keys-for-snowflake](https://medium.com/snowflake/dbt-constraints-automatic-primary-keys-unique-keys-and-foreign-keys-for-snowflake-d78cbfdec2f9)
- [ ] [running-dbt-with-airflow](https://www.datafold.com/blog/running-dbt-with-airflow?source=post_page-----28e335be5f7e--------------------------------)

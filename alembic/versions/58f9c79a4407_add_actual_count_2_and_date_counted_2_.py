"""Add actual_count_2 and date_counted_2 to finished_goods_inventory

Revision ID: 58f9c79a4407
Revises: 9e21944f5703
Create Date: 2024-10-11 14:20:52.649883

"""
from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision: str = '58f9c79a4407'
down_revision: Union[str, None] = '9e21944f5703'
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    # ### commands auto generated by Alembic - please adjust! ###
    op.add_column('finished_goods_inventory', sa.Column('actual_count_2', sa.Float(), nullable=True))
    op.add_column('finished_goods_inventory', sa.Column('date_counted_2', sa.DateTime(), nullable=True))
    # ### end Alembic commands ###


def downgrade() -> None:
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_column('finished_goods_inventory', 'actual_count_2')
    op.drop_column('finished_goods_inventory', 'date_counted_2')
    # ### end Alembic commands ###

from app.models.Firm import Firm
from app.models.ImageFirm import ImageFirm
from app import db



def get_firm_by_id(firm_id):

    """Retrieve a firm by its ID."""
    return Firm.query.filter_by(ID=firm_id, is_delete=False).first()


def get_all_firms():
    """Retrieve all firms."""
    return Firm.query.filter_by(is_delete=False).all()


def create_firm(name, description, thumbnail, start_date=None, end_date=None, rating=0, rating_count=0, images=None):
    """Create a new firm."""
    if Firm.query.filter_by(name=name, is_delete=False).first():
        raise ValueError("Firm with this name already exists")

    if end_date == '':
        end_date = None
    if start_date == '':
        start_date = None
    
    
    try:
        new_firm = Firm(
            name=name,
            description=description,
            thumbnail=thumbnail,
            start_date=start_date,
            end_date=end_date,
            rating=rating,
            rating_count=rating_count
        )
        db.session.add(new_firm)
        db.session.commit()
    except Exception as e:
        db.session.rollback()
        raise ValueError(f"Error creating firm: {str(e)}")
    if images:
        try:
            for image in images:
                new_image = ImageFirm(
                    firm_id=new_firm.ID,
                    image_url=image
                )
                db.session.add(new_image)
            db.session.commit()
        except Exception as e:
            db.session.rollback()
            raise ValueError(f"Error adding images: {str(e)}")
    return new_firm


def update_firm(firm_id, name=None, description=None, thumbnail=None, rating=None, rating_count=None):
    """Update an existing firm."""
    firm = get_firm_by_id(firm_id)
    if not firm:
        raise ValueError("Firm not found")

    if name:
        firm.name = name
    if description:
        firm.description = description
    if thumbnail:
        firm.thumbnail = thumbnail
    if rating:
        firm.rating = rating
    if rating_count:
        firm.rating_count = rating_count

    try:
        db.session.commit()
    except Exception as e:
        db.session.rollback()
        raise ValueError(f"Error updating firm: {str(e)}")
    
    return firm


def delete_firm(firm_id):
    """Soft delete a firm by setting is_delete to True."""
    firm = get_firm_by_id(firm_id)
    if not firm:
        raise ValueError("Firm not found")

    firm.is_delete = True
    try:
        db.session.commit()
    except Exception as e:
        db.session.rollback()
        raise ValueError(f"Error deleting firm: {str(e)}")
    
    return firm
